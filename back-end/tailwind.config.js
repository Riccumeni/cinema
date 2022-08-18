/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./resources/**/*.blade.php",
    "./resources/**/*.js",
    "./resources/**/*.vue",
  ],
  theme: {
    extend: {
      colors: {
        'navbar' : '#002C57',
        'body' : '#001C38',
        'secondary' : "#4991FE"
      }
    },
  },
  plugins: [],
}