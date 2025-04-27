# RapidRecon 🚀
Fast and automated reconnaissance

**RapidRecon** is a powerful automated website scanning tool that helps you perform comprehensive reconnaissance and vulnerability assessment on any live web target — with just **one command**.

---

## 🛠️ Features

- 🔥 Fully automated end-to-end scanning
- 🌐 Subdomain Enumeration (Subfinder, Assetfinder, Amass)
- ⚡ Port Scanning + Vulnerability Scripts (Nmap)
- 🔎 Web Vulnerability Testing (Nikto, OWASP ZAP, Wapiti)
- 🛡️ Basic SQL Injection Testing (SQLmap)
- 📸 Screenshots of Discovered Assets (Aquatone)
- 🗂️ Organized output folders per target
- 🎨 Colored terminal output for better readability
- ⏳ Timestamps for scan tracking
- 🛠️ Easy to extend with more tools in the future

---

## 📦 Folder Structure

RapidRecon/ 
├── scans/ 
│ └── target.com/ 
│ ├── nmap.txt 
│ ├── nikto.txt 
│ ├── zap.txt 
│ ├── wapiti.txt 
│ ├── sqlmap.txt 
│ ├── subdomains.txt 
│ └── screenshots/ 
├── install_tools.sh 
├── run_scan.sh 
└── README.md


---

## 🚀 Installation

First, clone the repository:

```bash
git clone https://github.com/yourusername/RapidRecon.git
cd RapidRecon
chmod +x install_tools.sh
./install_tools.sh
```
# ⚙️Requirements
RapidRecon relies on the following tools:

nmap

nikto

zap-cli (OWASP ZAP)

subfinder

assetfinder

amass

sqlmap

wapiti

aquatone

go (for some tool installations)

#  Sample Output
After scanning, you will find:

Discovered subdomains

Open ports and vulnerable services

Web vulnerabilities

SQL injection test reports

Screenshots of active hosts

```bash
[*] Subdomain discovery completed: 45 subdomains found.
[*] Nmap scan completed: 3 open ports.
[*] Nikto vulnerabilities saved.
[*] Screenshots saved to scans/target.com/screenshots/
[*] Full scan report ready at scans/target.com/
```
# ⚠️ Disclaimer
This tool is intended ONLY for educational purposes and authorized penetration testing.
Scanning websites without permission is illegal.
The developer is not responsible for any misuse of this tool.

# ❤️ Contributing
Pull requests are welcome!
If you have suggestions for improvements, feel free to open an issue or PR.

# 📜 License
This project is licensed under the MIT License.

## 🔥 Let's Automate. Let's Hunt. Happy Hacking! 👨‍💻🖤

```bash

---

# ✅ Now your GitHub will look **professional**!

Would you like me to also write a **badass short project description** for your GitHub "About" section too? (like a tagline) 🚀  
Example:  
> **"One input, full recon: RapidRecon automates your web vulnerability scanning like a pro."**  
Want more like that? 😎✨
