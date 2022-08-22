<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  @vite('resources/css/app.css')
</head>
<body class="bg-body">
  <nav class="sticky top-0 z-50 bg-navbar h-12 p-5 flex justify-between items-center">
    <h2 class="text-xl text-white">Cinema</h2>
    <h2 class="text-xl text-white hover:underline cursor-pointer">Login</h2>
  </nav>
  <div class="m-5">
    <input class="bg-transparent border white text-white" placeholder="SELEZIONA UN FILM">
    <input class="bg-transparent border white text-white ml-4" placeholder="SELEZIONA UN ORARIO">
  </div>
  <div class="m-5">
    <h1 class="text-4xl tracking-widest inline-block align-baseline text-secondary">PROGRAMMAZIONE</h1>
    <div class="px-4 bg-secondary h-10 w-4/5 flex justify-start gap-x-5">
      <button class="text-white text-[12px] focus:border-b-2 white">NELLE SALE</button>
      <button class="text-white text-[12px] focus:border-b-2 white">IN ARRIVO</button>
    </div>
    <div class="mt-8 flex gap-4">
      <div class="bg-white-200 border white bg-grey h-56 w-40"></div>
      <div class="bg-white-200 border white bg-grey h-56 w-40"></div>
      <div class="bg-white-200 border white bg-grey h-56 w-40"></div>
      <div class="bg-white-200 border white bg-grey h-56 w-40"></div>
      <div class="bg-white-200 border white bg-grey h-56 w-40"></div>
      <div class="bg-white-200 border white bg-grey h-56 w-40"></div>
    </div>
    <div class="mt-8">
      <h1 class="text-4xl tracking-widest inline-block align-baseline text-secondary">LA NOSTRA APP</h1>
      <div class="px-4 bg-secondary h-10 w-4/5 flex justify-start gap-x-5"></div>
      <div class="bg-black w-4/5 h-96 pt-10 flex justify-evenly">
        <div class="border white h-full w-1/4"></div>
        <div>
          <h1 class="text-2xl text-white font-serif">Scopri l'App del nostro cinema</h1>
          <h1 class="pt-4 text-lg text-white font-sans">Potrai prenotare i tuoi spettacoli direttamente dallo smartphone.</h1>
          <button class="bg-secondary text-white p-2 rounded mt-4">Download</button>
        </div>
      </div>
    </div>
  </div>
</body>
</html>