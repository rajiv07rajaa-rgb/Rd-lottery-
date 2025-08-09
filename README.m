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
<!DOCTYPE html><html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>RD Lottery - Color Prediction Game</title>
  <style>
    body {
      margin: 0;
      font-family: Arial, sans-serif;
      background: #f2f2f2;
      color: #333;
      text-align: center;
    }
    header {
      background: #673ab7;
      color: white;
      padding: 15px 0;
      font-size: 24px;
      font-weight: bold;
    }
    .container {
      padding: 20px;
    }
    .timer {
      font-size: 22px;
      margin-bottom: 20px;
    }
    .round-count {
      margin-bottom: 10px;
      font-weight: bold;
    }
    .grid {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      margin-bottom: 20px;
    }
    .number-box {
      width: 60px;
      height: 60px;
      margin: 5px;
      border-radius: 50%;
      font-size: 20px;
      line-height: 60px;
      color: white;
      cursor: pointer;
      user-select: none;
    }
    .green { background: green; }
    .red { background: red; }
    .result {
      margin-top: 15px;
      font-size: 18px;
    }
    .history {
      margin-top: 20px;
      font-size: 16px;
      max-height: 200px;
      overflow-y: auto;
    }
    .account, .service, .payment {
      background: white;
      margin: 20px 10px;
      padding: 15px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    @media screen and (max-width: 600px) {
      .number-box {
        width: 45px;
        height: 45px;
        line-height: 45px;
        font-size: 16px;
      }
    }
  </style>
</head>
<body><header>RD Lottery</header><div class="container">
  <div class="round-count">Game Count: <span id="gameCount">1</span></div>
  <div class="timer">⏱ Time Left: <span id="timer">30</span>s</div>  <div class="grid" id="numberGrid">
    <!-- Boxes will be added here by JS -->
  </div>  <div class="result">Result: <span id="result">Pending...</span></div>
  <div class="history" id="history">History:<br></div>  <div class="account">
    <h3>Account</h3>
    <p>Balance: ₹<span id="balance">1000</span></p>
  </div>  <div class="payment">
    <h3>Payment Section</h3>
    <button onclick="addFunds(500)">Add ₹500</button>
    <button onclick="addFunds(1000)">Add ₹1000</button>
  </div>  <div class="service">
    <h3>Customer Service</h3>
    <p>Contact us at: <b>support@rdlottery.com</b></p>
  </div>
</div><script>
  const greenNums = [0, 2, 4, 6, 8];
  const redNums = [1, 3, 5, 7, 9];
  const grid = document.getElementById("numberGrid");
  const resultSpan = document.getElementById("result");
  const historyDiv = document.getElementById("history");
  const balanceSpan = document.getElementById("balance");
  const gameCountSpan = document.getElementById("gameCount");

  let timer = 30;
  let gameCount = 1;
  let interval;
  let userBets = {};

  function startGame() {
    timer = 30;
    userBets = {};
    resultSpan.innerText = 'Pending...';
    grid.innerHTML = '';
    for (let i = 0; i <= 9; i++) {
      const box = document.createElement("div");
      box.classList.add("number-box");
      box.classList.add(greenNums.includes(i) ? "green" : "red");
      box.innerText = i;
      box.onclick = () => placeBet(i);
      grid.appendChild(box);
    }
    interval = setInterval(() => {
      document.getElementById("timer").innerText = timer;
      if (timer === 0) {
        clearInterval(interval);
        showResult();
      }
      timer--;
    }, 1000);
  }

  function placeBet(number) {
    if (!userBets[number]) userBets[number] = 0;
    userBets[number] += 1;
    balanceSpan.innerText = parseInt(balanceSpan.innerText) - 10;
    alert("Bet placed on number: " + number);
  }

  function showResult() {
    let leastBet = Infinity;
    let result = 0;
    for (let i = 0; i <= 9; i++) {
      const bet = userBets[i] || 0;
      if (bet < leastBet) {
        leastBet = bet;
        result = i;
      }
    }
    resultSpan.innerText = result;
    historyDiv.innerHTML += `Round ${gameCount}: ${result}<br>`;
    gameCount++;
    gameCountSpan.innerText = gameCount;
    setTimeout(startGame, 5000);
  }

  function addFunds(amount) {
    balanceSpan.innerText = parseInt(balanceSpan.innerText) + amount;
    alert(`₹${amount} added to your account.`);
  }

  startGame();
</script></body>
</html>
