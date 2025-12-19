# Solana Copy Trading Bot 🤖⚡

An **advanced Solana copy trading bot** designed for **high-speed, secure, and automated DeFi trading**. This project uses **non-blocking parallel execution**, **must-selling protection**, and **multi-DEX fallback** to safely copy trades on the Solana blockchain.

Built for reliability and performance, the bot ensures **no missed sells**, **no blocked streams**, and **automatic balance management**, even under heavy network load.

---

## 🚀 Key Features

* **Solana Copy Trading** – Automatically replicate target wallet trades in real time
* **Parallel Transaction Processing** – Buy and sell operations run concurrently without blocking the main stream
* **Must-Selling Logic** – Guaranteed sell attempts with retries and fallback strategies
* **Multi-DEX Support** – Native trading on **PumpFun**, **PumpSwap**, and **Raydium** with **Jupiter API fallback**
* **Balance Monitoring Service** – Continuous background checks to prevent stuck tokens
* **Automatic SOL / WSOL Management** – Smart wrapping and rebalancing after trades
* **High Reliability** – Designed to prevent lost transactions during network congestion

---

## 🏗️ Architecture Overview

### Non-Blocking Main Stream

* Continuously monitors target wallets using Yellowstone gRPC
* Immediately submits buy/sell operations to parallel workers
* Never pauses or waits for transaction completion

### Parallel Transaction Processor

* Each trade runs in an independent spawned task
* Multiple operations execute simultaneously
* Built-in retry logic and error handling per transaction

---

## 🔁 Must-Selling System (Fail-Safe Design)

Every sell operation follows a robust fallback sequence:

1. **Native DEX Sell (3 retries)**

   * PumpFun / PumpSwap / Raydium Launchpad
   * Ultra-low latency execution

2. **Jupiter API Fallback (3 retries)**

   * Automatically triggered if native DEX fails
   * Includes SOL/WSOL balance handling

3. **Balance Verification**

   * Confirms token balance before selling
   * Prevents unnecessary or failing transactions

This guarantees tokens are **never left unsold**.

---

## 🧠 Balance Monitoring & Automation

* Wallet scanned every **2 minutes** by default
* Any remaining tokens are **automatically sold**
* SOL / WSOL balances are rebalanced after sells
* SOL is auto-wrapped to prepare for upcoming trades

This system acts as a **self-healing safety net**.

---

## 🔧 Configuration

### Environment Variables

```env
BALANCE_MONITOR_INTERVAL_SECONDS=120
AUTO_WRAP_ENABLED=true
WRAP_AMOUNT=0.1
SOL_WSOL_TARGET_RATIO=0.5
REBALANCE_THRESHOLD=0.2
```

---

## ▶️ Usage

### Start the Bot

```bash
cargo run
```

### Manual Commands

```bash
cargo run -- --sell      # Emergency sell all
cargo run -- --balance   # Balance management
cargo run -- --wrap      # Manual SOL wrapping
```

---

## 🛡️ Security & Reliability

* Multi-layer sell fallback strategy
* Automatic retries with error logging
* Continuous background balance monitoring
* No blocking operations in the main stream
* Safe handling of SOL and WSOL balances

---

## 📈 Why This Solana Trading Bot?

* Designed for **copy trading on Solana**
* Optimized for **speed, safety, and uptime**
* Prevents stuck tokens and missed exits
* Ideal for **high-frequency and competitive DeFi environments**

---

## ⭐ Support the Project

If this **Solana copy trading bot** helps you:

* ⭐ Star the repository
* 🍴 Fork and customize strategies
* 🐛 Open issues or feature requests

---

## ⚠️ Disclaimer

This project is for **educational and research purposes only**. Cryptocurrency trading involves significant risk. Use at your own responsibility.
