let mix = require("laravel-mix")
let path = require("path")

require("laravel-mix-tailwind");

mix.setPublicPath(path.resolve("./"));

mix.js("assets/scripts/app.js", "build");

mix.sass("assets/styles/app.scss", "build");

// mix.sass("resources/css/editor-style.scss", "./");

mix.tailwind();

mix.browserSync({
    proxy: "localhost:10023",
    host: "localhost:10023",
    injectChanges: false,
    files: ["./build", "./views"],
    port: 8080,
    open: true // Mettre à "true" pour ouvrir un onglet automatiquement (http://localhost:8080)
});

mix.version();
