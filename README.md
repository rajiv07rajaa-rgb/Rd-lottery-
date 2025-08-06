
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Color Trading Website</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f5f5f5;
      text-align: center;
      padding: 20px;
    }

    h1 {
      color: #333;
    }

    .color-box {
      width: 100px;
      height: 100px;
      margin: 20px auto;
      border-radius: 10px;
      border: 3px solid #333;
    }

    select {
      padding: 10px;
      font-size: 16px;
    }

    .buttons {
      margin-top: 20px;
    }

    button {
      padding: 10px 20px;
      font-size: 16px;
      margin: 10px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    .buy {
      background-color: green;
      color: white;
    }

    .sell {
      background-color: red;
      color: white;
    }

    .history {
      margin-top: 30px;
      max-width: 400px;
      margin-left: auto;
      margin-right: auto;
      background: #fff;
      border: 1px solid #ddd;
      padding: 15px;
      border-radius: 10px;
    }

    .history h3 {
      margin-bottom: 10px;
    }

    .history ul {
      list-style: none;
      padding: 0;
    }

    .history li {
      padding: 5px 0;
      border-bottom: 1px solid #eee;
    }
  </style>
</head>
<body>

  <h1>🎨 Color Trading Website</h1>

  <label for="colorSelect">Select a Color:</label>
  <select id="colorSelect" onchange="updateColor()">
    <option value="blue">Blue</option>
    <option value="green">Green</option>
    <option value="red">Red</option>
    <option value="orange">Orange</option>
    <option value="purple">Purple</option>
  </select><!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Color Trading - Login/Register</title>
  <style>
    body { font-family: Arial; padding: 20px; background: #f2f2f2; }
    .box { max-width: 400px; margin: auto; background: white; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
    h2 { text-align: center; }
    input, button { width: 100%; padding: 10px; margin: 10px 0; }
    .hidden { display: none; }
  </style>
</head>
<body>
  <div class="box">
    <h2 id="formTitle">Login</h2>
    <input type="text" id="username" placeholder="Username" />
    <input type="password" id="password" placeholder="Password" />
    <button onclick="submitForm()">Submit</button>
    <p id="toggleText">New user? <a href="#" onclick="toggleForm()">Register here</a></p>
  </div>

  <script src="script.js"></script>
</body>
</html>

  <div class="color-box" id="colorBox"></div>

  <div class="buttons">
    <button class="buy" onclick="trade('Buy')">Buy</button>
    <button class="sell" onclick="trade('Sell')">Sell</button>
  </div>

  <div class="history">
    <h3>📈 Trade History</h3>
    <ul id="tradeHistory">
      <!-- history items will go here -->
    </ul>
  </div>

  <script>
    const colorBox = document.getElementById('colorBox');
    const tradeHistory = document.getElementById('tradeHistory');

    function updateColor() {
      const selectedColor = document.getElementById('colorSelect').value;
      colorBox.style.backgroundColor = selectedColor;
    }

    function trade(action) {
      const color = document.getElementById('colorSelect').value;
      const time = new Date().toLocaleTimeString();
      const li = document.createElement('li');
      li.textContent = `${action} ${color} at ${time}`;
      tradeHistory.prepend(li);
    }

    // Set initial color
    updateColor();
  </script>

</body>
</html><!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Admin Panel</title>
  <style>
    body { font-family: Arial; padding: 20px; }
    table { width: 100%; border-collapse: collapse; }
    th, td { border: 1px solid #ccc; padding: 8px; }
    th { background: #f0f0f0; }
  </style>
</head>
<body>
  <h2>Admin Panel</h2>
  <table id="userTable">
    <thead><tr><th>Username</th><th>Balance</th><th>Action</th></tr></thead>
    <tbody></tbody>
  </table><!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Color Trading - Login/Register</title>
  <style>
    body { font-family: Arial; padding: 20px; background: #f2f2f2; }
    .box { max-width: 400px; margin: auto; background: white; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
    h2 { text-align: center; }
    input, button { width: 100%; padding: 10px; margin: 10px 0; }
    .hidden { display: none; }
  </style>
</head>
<body>
  <div class="box">
    <h2 id="formTitle">Login</h2>
    <input type="text" id="username" placeholder="Username" />
    <input type="password" id="password" placeholder="Password" />
    <button onclick="submitForm()">Submit</button>
    <p id="toggleText">New user? <a href="#" onclick="toggleForm()">Register here</a></p>
  </div>

  <script src="script.js"></script>
</body>
</html>

  <script src="script.js"></script>
</body>
</html>let users = JSON.parse(localStorage.getItem("users")) || {};

function submitForm() {
  const user = document.getElementById("username").value;
  const pass = document.getElementById("password").value;
  const mode = document.getElementById("formTitle").innerText;

  if (mode === "Register") {
    if (users[user]) return alert("User already exists");
    users[user] = { password: pass, balance: 10000 };
    localStorage.setItem("users", JSON.stringify(users));
    alert("Registered successfully! Now login.");
    toggleForm();
  } else {
    if (!users[user] || users[user].password !== pass) return alert("Invalid login");
    localStorage.setItem("currentUser", user);
    alert("Login successful!");
    // Yaha redirect karo tumhare color trading page pe
    window.location.href = "trade.html";
  }
}

function toggleForm() {
  const title = document.getElementById("formTitle");
  const toggle = document.getElementById("toggleText");
  if (title.innerText === "Login") {
    title.innerText = "Register";
    toggle.innerHTML = 'Already registered? <a href="#" onclick="toggleForm()">Login here</a>';
  } else {
    title.innerText = "Login";
    toggle.innerHTML = 'New user? <a href="#" onclick="toggleForm()">Register here</a>';
  }
}

// Admin Panel
if (window.location.pathname.includes("admin.html")) {
  const tableBody = document.querySelector("#userTable tbody");
  Object.entries(users).forEach(([u, d]) => {
    const row = document.createElement("tr");
    row.innerHTML = `<td>${u}</td><td>${d.balance}</td><td><button onclick="resetBalance('${u}')">Reset</button></td>`;
    tableBody.appendChild(row);
  });
}

function resetBalance(username) {
  users[username].balance = 10000;
  localStorage.setItem("users", JSON.stringify(users));
  alert("Balance reset for " + username);
  location.reload();
}
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Admin Panel</title>
  <style>
    body { font-family: Arial; padding: 20px; }
    table { width: 100%; border-collapse: collapse; }
    th, td { border: 1px solid #ccc; padding: 8px; }
    th { background: #f0f0f0; }
  </style>
</head>
<body>
  <h2>Admin Panel</h2>
  <table id="userTable">
    <thead><tr><th>Username</th><th>Balance</th><th>Action</th></tr></thead>
    <tbody></tbody>
  </table>

  <script src="script.js"></script>
</body>
</html>let users = JSON.parse(localStorage.getItem("users")) || {};

function submitForm() {
  const user = document.getElementById("username").value;
  const pass = document.getElementById("password").value;
  const mode = document.getElementById("formTitle").innerText;

  if (mode === "Register") {
    if (users[user]) return alert("User already exists");
    users[user] = { password: pass, balance: 10000 };
    localStorage.setItem("users", JSON.stringify(users));
    alert("Registered successfully! Now login.");
    toggleForm();
  } else {
    if (!users[user] || users[user].password !== pass) return alert("Invalid login");
    localStorage.setItem("currentUser", user);
    alert("Login successful!");
    // Yaha redirect karo tumhare color trading page pe
    window.location.href = "trade.html";
  }
}

function toggleForm() {
  const title = document.getElementById("formTitle");
  const toggle = document.getElementById("toggleText");
  if (title.innerText === "Login") {
    title.innerText = "Register";
    toggle.innerHTML = 'Already registered? <a href="#" onclick="toggleForm()">Login here</a>';
  } else {
    title.innerText = "Login";
    toggle.innerHTML = 'New user? <a href="#" onclick="toggleForm()">Register here</a>';
  }
}

// Admin Panel
if (window.location.pathname.includes("admin.html")) {
  const tableBody = document.querySelector("#userTable tbody");
  Object.entries(users).forEach(([u, d]) => {
    const row = document.createElement("tr");
    row.innerHTML = `<td>${u}</td><td>${d.balance}</td><td><button onclick="resetBalance('${u}')">Reset</button></td>`;
    tableBody.appendChild(row);
  });
}

function resetBalance(username) {
  users[username].balance = 10000;
  localStorage.setItem("users", JSON.stringify(users));
  alert("Balance reset for " + username);
  location.reload();
}
