<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>RD Lottery Game</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; font-family: sans-serif; }
    body { background: #f1f1f1; }
    header { background: #000; color: #fff; padding: 15px; text-align: center; font-size: 24px; }
    nav { display: flex; justify-content: space-around; background: #222; color: white; padding: 10px; }
    nav a { color: white; text-decoration: none; }
    .container { padding: 20px; text-align: center; }

    /* Game board */
    .game-board { margin-top: 20px; }
    .number-row { display: flex; justify-content: center; margin: 10px 0; }
    .number { width: 60px; height: 60px; border-radius: 50%; margin: 5px; display: flex; align-items: center; justify-content: center; font-size: 20px; color: white; font-weight: bold; }
    .green { background-color: green; }
    .red { background-color: red; }

    /* Bet buttons */
    .bet-buttons { margin: 20px 0; }
    .bet-buttons button { padding: 10px 20px; font-size: 18px; margin: 5px; }

    /* Timer */
    .timer { font-size: 24px; font-weight: bold; margin-top: 10px; }

    /* History */
    .history { margin-top: 20px; }
    .history h3 { margin-bottom: 10px; }
    .history-box { background: #ddd; padding: 10px; border-radius: 5px; max-height: 150px; overflow-y: auto; }

    /* Sections */
    .section { margin: 20px 0; padding: 10px; background: #fff; border-radius: 10px; }

    /* Login form */
    .login { display: none; padding: 40px; text-align: center; }
    .login input { margin: 10px; padding: 10px; width: 200px; }

    /* Show/Hide */
    .hide { display: none; }
    .show { display: block; }

  </style>
</head>
<body>

<header>RD Lottery</header>
<nav>
  <a href="#" onclick="showPage('game')">Game</a>
  <a href="#" onclick="showPage('account')">Account</a>
  <a href="#" onclick="showPage('services')">Services</a>
  <a href="#" onclick="showPage('admin')">Admin</a>
</nav>

<!-- LOGIN FORM -->
<div class="login" id="loginPage">
  <h2>Login to RD Lottery</h2>
  <input type="text" placeholder="Username"><br>
  <input type="password" placeholder="Password"><br>
  <button onclick="login()">Login</button>
</div>

<!-- GAME PAGE -->
<div class="container show" id="gamePage">
  <div class="section">
    <h2>Choose Color to Bet</h2>
    <div class="bet-buttons">
      <button class="green" onclick="placeBet('Green')">Green</button>
      <button class="red" onclick="placeBet('Red')">Red</button>
    </div>

    <div class="game-board">
      <div class="number-row">
        <div class="number green">0</div>
        <div class="number red">1</div>
        <div class="number green">2</div>
        <div class="number red">3</div>
        <div class="number green">4</div>
      </div>
      <div class="number-row">
        <div class="number red">5</div>
        <div class="number green">6</div>
        <div class="number red">7</div>
        <div class="number green">8</div>
        <div class="number red">9</div>
      </div>
    </div>

    <div class="timer" id="timer">00:30</div>
    <button onclick="startTimer()">Start 30s Timer</button>
    <button onclick="startMinute()">Start 1 Minute</button>
  </div>

  <div class="history section">
    <h3>Result History</h3>
    <div class="history-box" id="historyLog"></div>
  </div>
</div>

<!-- ACCOUNT PAGE -->
<div class="container section hide" id="accountPage">
  <h2>Account Details</h2>
  <p>Username: demo_user</p>
  <p>Balance: ₹10,000</p>
</div>

<!-- SERVICES PAGE -->
<div class="container section hide" id="servicesPage">
  <h2>Services</h2>
  <p>24x7 Support, Instant Withdrawals, Game Updates etc.</p>
</div>

<!-- ADMIN PAGE -->
<div class="container section hide" id="adminPage">
  <h2>Admin Panel</h2>
  <p>Manage users, view reports, update results etc.</p>
</div>

<script>
  // Login simulation
  function login() {
    document.getElementById('loginPage').classList.add('hide');
    document.getElementById('gamePage').classList.add('show');
  }

  // Navigation
  function showPage(page) {
    document.getElementById('gamePage').classList.add('hide');
    document.getElementById('accountPage').classList.add('hide');
    document.getElementById('servicesPage').classList.add('hide');
    document.getElementById('adminPage').classList.add('hide');

    document.getElementById(page + 'Page').classList.remove('hide');
  }

  // Timer
  let timerInterval;
  function startTimer(duration = 30) {
    clearInterval(timerInterval);
    let time = duration;
    const display = document.getElementById("timer");

    timerInterval = setInterval(() => {
      let minutes = Math.floor(time / 60);
      let seconds = time % 60;
      display.textContent = `${minutes < 10 ? '0' : ''}${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;
      time--;

      if (time < 0) {
        clearInterval(timerInterval);
        display.textContent = "Time Over!";
        logResult();
      }
    }, 1000);
  }

  function startMinute() {
    startTimer(60);
  }

  // Betting result log
  function placeBet(color) {
    const log = document.getElementById("historyLog");
    const time = new Date().toLocaleTimeString();
    const entry = document.createElement("div");
    entry.textContent = `Bet on ${color} at ${time}`;
    log.prepend(entry);
  }

  function logResult() {
    const log = document.getElementById("historyLog");
    const time = new Date().toLocaleTimeString();
    const entry = document.createElement("div");
    entry.textContent = `Result shown at ${time}`;
    log.prepend(entry);
  }
</script>

</body>
</html>
