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
    <div class="p-10 flex gap-10">
        <div class="bg-white-200 border white h-[32rem] w-[22rem]"><img src="https://pad.mymovies.it/filmclub/2019/05/046/locandinapg1.jpg"></div>
        <div class="flex flex-col gap-5">
            <h1 class="text-3xl text-white">Doctor Strange nel Multiverso della Follia</h1>
            <div class="flex flex-col gap-4">
                <h1 class="text-2xl text-white">Trama</h1>
                <p class="text-white max-w-3xl">Doctor Strange nel Multiverso della Follia, il film diretto da Sam Raimi, vede il ritorno di Benedict Cumberbatch nei panni di Stephen Strange, il personaggio creato da Stan Lee e dal disegnatore Steve Ditko, comparso nell'Universo Marvel nel 1963. Il film vede Doctor Strange, il suo fidato amico Wong (Benedict Wong) e Wanda (Elizabeth Olsen), nota come Scarlet Witch, affrontare l'immensità del Multiverso, un concetto - a detta dello stesso Strange - di cui sanno ben poco. Grazie all'aiuto di alleati mistici, tra cui quelli già nominati e altri di nuova conoscenza, Dottor Strange questa volta affronterà le realtà alternative del Multiverso, che si riveleranno sia sconvolgenti che pericolose. Lo scopo di questa ardua missione è sconfiggere un misterioso nemico...</p>
                <h1 class="text-2xl text-white">Trailer</h1>
                <iframe width="560" height="315" src="https://www.youtube.com/embed/DkqjdOIi6tk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </div>
            <div class="flex flex-col gap-4">
                <h1 class="text-2xl text-white">Spettacoli</h1>
                <table class="table-fixed text-white text-center border-collapse border border-slate-500">
                    <thead>
                        <tr class="bg-slate-700">
                            <td class="border border-slate-500 p-2">Sala</td>
                            <td class="border border-slate-500 p-2">Orario</td>
                            <td class="border border-slate-500 p-2">Posti Disponibili</td>
                            <td class="border border-slate-500 p-2">Prenota</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="border border-slate-500 p-2">2</td>
                            <td class="border border-slate-500 p-2">15 giugno 17:30</td>
                            <td class="border border-slate-500 p-2">30</td>
                            <td class="border border-slate-500 p-2 hover:underline cursor-pointer"><a>Clicca qui</a></td>
                        </tr>
                        <tr>
                            <td class="border border-slate-500 p-2">2</td>
                            <td class="border border-slate-500 p-2">15 giugno 20:00</td>
                            <td class="border border-slate-500 p-2">20</td>
                            <td class="border border-slate-500 p-2 hover:underline cursor-pointer"><a>Clicca qui</a></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>