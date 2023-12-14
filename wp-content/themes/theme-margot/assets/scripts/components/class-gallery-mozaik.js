import gsap from 'gsap';

class CoverRealisations {
    constructor( element )
    {
        this.$images = element.querySelectorAll('.bloc-gallery-mozaik--image')

        const numImages = this.$images.length;
        const angleIncrement = Math.PI / (numImages - 1); // Ajustez l'angle en fonction du nombre d'images

        for (let i = 0; i < numImages; i++) {
            const angle = angleIncrement * i;
            const radiusX = element.offsetWidth / 2;
            const radiusY = element.offsetHeight / 2;

            const x = radiusX * Math.cos(angle) + radiusX; // Ajustez le rayon selon vos besoins
            const y = radiusY * Math.sin(angle) + radiusY; // Ajustez le rayon selon vos besoins

            // Ajustement pour placer la première image en haut à gauche
            if (i === 0) {
                this.$images[i].style.top = `0`;
                this.$images[i].style.left = `0`;
            } else {
                this.$images[i].style.top = `${y - this.$images[i].offsetHeight / 2}px`;
                this.$images[i].style.left = `${x - this.$images[i].offsetWidth / 2}px`;
            }

            // Ajustement pour placer l'image à la moitié en bas à droite
            if (i === Math.floor(numImages / 2)) {
                this.$images[i].style.top = `${element.offsetHeight - this.$images[i].offsetHeight}px`;
                this.$images[i].style.left = `${element.offsetWidth - this.$images[i].offsetWidth}px`;
            }
        }
    }
}

export default CoverRealisations
