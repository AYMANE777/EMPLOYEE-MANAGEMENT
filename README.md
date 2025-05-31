<div align="center">
  <h1>EMPLOYEE-MANAGEMENT</h1>
  <p><em>Comprehensive ASP.NET Web App for Employee, Vehicle, and Mission Management</em></p>
  <img alt="last-commit" src="https://img.shields.io/github/last-commit/AYMANE777/EMPLOYEE-MANAGEMENT?style=flat&logo=git&logoColor=white&color=0080ff">
  <img alt="repo-top-language" src="https://img.shields.io/github/languages/top/AYMANE777/EMPLOYEE-MANAGEMENT?style=flat&color=0080ff">
  <img alt="repo-language-count" src="https://img.shields.io/github/languages/count/AYMANE777/EMPLOYEE-MANAGEMENT?style=flat&color=0080ff">
  <p><em>Built with the tools and technologies:</em></p>
  <img alt=".NET" src="https://img.shields.io/badge/.NET-512BD4.svg?style=flat&logo=dotnet&logoColor=white">
  <img alt="C#" src="https://img.shields.io/badge/C%23-239120.svg?style=flat&logo=c-sharp&logoColor=white">
  <img alt="Entity Framework" src="https://img.shields.io/badge/Entity%20Framework-512BD4.svg?style=flat&logo=entity-framework&logoColor=white">
  <img alt="SQL Server" src="https://img.shields.io/badge/SQL%20Server-CC2927.svg?style=flat&logo=microsoft-sql-server&logoColor=white">
</div>

---

<h2>🔍 Overview</h2>
<p><strong>EMPLOYEE-MANAGEMENT-ASPNET</strong> is an ASP.NET web application developed using C# and Entity Framework. It is designed to manage employees (agents), vehicle assignments, fuel logs, and mission tracking in a corporate or governmental environment.</p>

<h3>💡 Core Objectives:</h3>
<ul>
  <li>📑 Centralized employee and vehicle management</li>
  <li>📌 Streamlined mission planning and tracking</li>
  <li>⛽ Fuel usage monitoring via bon plein records</li>
  <li>🛠 Maintenance and repair log tracking</li>
  <li>🔐 Secure login and role-based access control</li>
</ul>

---

<h2>🧱 Main Features</h2>
<ul>
  <li>👨‍💼 <strong>Agent Management:</strong> Track employee records, job roles, and mission assignments</li>
  <li>🚗 <strong>Vehicle Tracking:</strong> Manage fleet data including models, owners, and categories</li>
  <li>🗺️ <strong>Mission Management:</strong> Assign and detail missions for agents and vehicles</li>
  <li>⛽ <strong>Fuel Management:</strong> BON_PLEIN for fuel logs linked to vehicles and missions</li>
  <li>⚙️ <strong>Maintenance:</strong> Record repairs, breakdowns (PANNE), and associated services</li>
  <li>🔐 <strong>Authentication:</strong> LOGIN.cs for secure user access control</li>
</ul>

---

<h2>📁 Key Entity Files</h2>
<table>
  <thead><tr><th>Entity</th><th>Description</th></tr></thead>
  <tbody>
    <tr><td><code>AGENT.cs</code></td><td>Stores employee/agent data</td></tr>
    <tr><td><code>MISSION.cs</code></td><td>Represents assignments linked to agents and vehicles</td></tr>
    <tr><td><code>BON_PLEIN.cs</code></td><td>Logs of fuel consumption per mission</td></tr>
    <tr><td><code>VEHICULE.cs</code></td><td>Vehicle registration and tracking</td></tr>
    <tr><td><code>REPARATION.cs</code></td><td>Vehicle repair records</td></tr>
    <tr><td><code>PANNE.cs</code></td><td>Breakdown logs</td></tr>
    <tr><td><code>PROPRIETAIRE.cs</code></td><td>Vehicle ownership information</td></tr>
    <tr><td><code>LOGIN.cs</code></td><td>User credentials and authentication logic</td></tr>
  </tbody>
</table>

---

<h2>🚀 Getting Started</h2>

<h3>📋 Prerequisites</h3>
<ul>
  <li>Visual Studio 2019 or later</li>
  <li>.NET Framework 4.7.2+</li>
  <li>SQL Server / LocalDB</li>
</ul>

<h3>📦 Installation</h3>
<pre><code class="language-sh">❯ git clone https://github.com/AYMANE777/EMPLOYEE-MANAGEMENT
❯ cd EMPLOYEE-MANAGEMENT
❯ Open the solution file (.sln) in Visual Studio
❯ Restore NuGet packages
❯ Update the connection string in Web.config
</code></pre>

<h3>💻 Running the App</h3>
<pre><code class="language-sh">❯ Press F5 to build and run in Visual Studio (IIS Express)
</code></pre>

---

<h2>🧪 Testing</h2>
<p>Manual test cases are applied for forms and workflows. Future updates may integrate unit testing using <code>NUnit</code> or <code>xUnit</code>.</p>

---

<h2>📌 Contributing</h2>
<p>Contributions and feedback are welcome. Fork the repo, create a new branch, and submit a pull request for changes.</p>

<h2>📄 License</h2>
<p>This project is released under the MIT License.</p>
