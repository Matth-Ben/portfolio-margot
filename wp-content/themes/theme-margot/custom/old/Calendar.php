<?php

class Calendar
{
    public string $dayName;
    
    public string $monthName;
    
    public string $day;
    
    public string $month;
    
    public string $year;

    public array $weeks;

    public int $weekday;

    public int $endmonth;

    public int $startweek; // sunday = 0, monday = 1

    public array $weekdays;

    public array $days;

    public array $weekdays_names;

    public string $previous_month;

    public string $next_month;

    public array $translations = [
        'fr' => [
            'months' => ['janvier', 'février', 'mars', 'avril', 'mai', 'juin', 'juillet', 'août', 'septembre', 'octobre', 'novembre', 'décembre'],
            'days' => ['dimanche', 'lundi', 'mardi', 'mercredi', 'jeudi', 'vendredi', 'samedi']
        ],
        'en' => [
            'months' => ['january', 'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december'],
            'days' => ['sunday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday']
        ]
    ];
 

    public function __construct($date, $startweek = 1, $translation = 'fr')
    {        
        $this->day = $date->format('d');
        $this->month = $date->format('m');
        $this->year = $date->format('Y');
        $this->weekday = $date->format('w');
        $this->endmonth = intval($date->format('t'));
        $this->startweek = $startweek;
        $this->monthName = isset($this->translations[$translation]['months'][intval($this->month) - 1]) ? $this->translations[$translation]['months'][intval($this->month) - 1] : null;
        $this->dayName = isset($this->translations[$translation]['days'][$this->weekday]) ? $this->translations[$translation]['days'][$this->weekday] : null;
        
        $this->weekdays = $this->get_weekdays();
        $this->days = $this->get_days();
        $this->weeks = $this->get_weeks();

        foreach ($this->weekdays as $weekday) {
            $this->weekdays_names[] = $this->translations[$translation]['days'][$weekday];
        }

        $d = new DateTime($date->format('Y-m'));
        $this->previous_month = ($d->modify('-1 month'))->format('Y-m');
        $this->next_month = ($d->modify('+2 month'))->format('Y-m');
    }

    public function get_weeks(array $days = null): array
    {
        $days = $days === null ? $this->days : $days;
        $count = 0;
        $weeks = [];

        foreach ($this->days as $key => $day) {
            $weeks[floor($count/7)][$key] = $day;
            $count++;
        }

        return $weeks;
    }

    public function get_days(): array
    {
        // today
        $current_date = new DateTime('now');
        $is_current_year = ($current_date->format('Y') === $this->year);
        $is_current_month = ($current_date->format('m') === $this->month);

        // startweek / endweek
        $weekdays = $this->weekdays;
        $startweek = $weekdays['0'];
        $endweek = $weekdays[count($weekdays) - 1];

        // results
        $days = [];
        
        for ($i = 1; $i < $this->endmonth + 1; $i++) {
            $numero = $i < 10 ? "0$i" : $i; // 5 --> "05"
            $datetext = $this->year . '-' . $this->month . '-' . $numero; // YYYY-mm-dd
            $date = new DateTime($datetext);

            // if the start month is not the startweek
            if ($i === 1 && intval($date->format('w')) !== $startweek) {
                $d = new DateTime($datetext);
                
                // while weekday of the new date is not equal to startweek, insert the new date
                while (intval($d->format('w')) !== $startweek) {
                    $d->modify('-1 day');
                    $dt = $d->format('Y-m-d');
                    $days = [
                        $dt => [
                            'numero' => $d->format('d'),
                            'is_active_month' => false,
                            'is_current_day' => false,
                            'is_current_month' => false,
                            'is_current_year' => ($d->format('Y') === $current_date->format('Y')),
                        ]
                    ] + $days;
                }
            }

            $days[$datetext] = [
                'numero' => $numero,
                'is_active_month' => true,
                'is_current_day' => ($is_current_year && $is_current_month && $i === intval($this->day)),
                'is_current_month' => $is_current_month,
                'is_current_year' => $is_current_year,
            ];

            // if the end month is not the endweek
            if ($i === $this->endmonth && intval($date->format('w')) !== $endweek) {
                $d = new DateTime($datetext);
                
                // while weekday of the new date is not equal to endweek, insert the new date
                while (intval($d->format('w')) !== $endweek) {
                    $d->modify('+1 day');
                    $dt = $d->format('Y-m-d');
                    $days[$dt] = [
                        'numero' => $d->format('d'),
                        'is_active_month' => false,
                        'is_current_day' => false,
                        'is_current_month' => false,
                        'is_current_year' => ($d->format('Y') === $current_date->format('Y')),
                    ];
                }
            }
        }

        return $days;
    }

    public function get_weekdays(): array
    {
        $weekdays = [];

        for ($i = 0; $i < 7; $i++) {
            $weekday = $this->startweek + $i;
            $weekdays[strval($i)] = $weekday < 7 ? $weekday : (7 - $weekday) * (-1); 
        }

        return $weekdays;
    }

    public function set_data(string $key, mixed $data, string $datetext): void
    {
        foreach ($this->weeks as $k => $week) {

            if (isset($week[$datetext])) {
                $this->weeks[$k][$datetext][$key] = $data;
                break; 
            }
        }

        if (isset($this->days[$datetext])) {
            $this->days[$datetext][$key] = $data;
        }
    }
}