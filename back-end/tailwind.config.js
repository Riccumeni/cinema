const defaultTheme = require('tailwindcss/defaultTheme');

/** @type {import('tailwindcss').Config} */
module.exports = {
    content: [
        './vendor/laravel/framework/src/Illuminate/Pagination/resources/views/*.blade.php',
        './storage/framework/views/*.php',
        './resources/views/**/*.blade.php',
    ],

    theme: {
        extend: {
            fontFamily: {
                sans: ['Nunito', ...defaultTheme.fontFamily.sans],
            },
        },
        colors: {
            "navbar": "#002C57",
            "body": "#001C38",
            "secondary": "#4991FE",
            "white": "#E6E6E6",
            "black": "#000000"
        }
    },

    plugins: [require('@tailwindcss/forms')],
};
