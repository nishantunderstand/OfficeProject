import pyautogui
import pyperclip
import time
import csv
import os

print("=" * 60)
print("🚀 FINAL & RELIABLE WhatsApp Sender – Single Tab Only")
print("✅ Open WhatsApp Web manually. Script sends messages via keyboard.")
print("=" * 60)

# 🔹 Configuration
csv_file = "WhatsAppAutomation.csv"

# 🔹 Check file
if not os.path.exists(csv_file):
    print(f"❌ Error: '{csv_file}' not found.")
    input("Press Enter to exit...")
    exit()

# 🔹 Instructions
print("ℹ️  STEP 1: Open your Chrome browser.")
print("ℹ️  STEP 2: Go to https://web.whatsapp.com")
print("ℹ️  STEP 3: Scan QR code if needed.")
print("ℹ️  STEP 4: DO NOT click on any chat.")
print("🔔 Press ENTER here ONLY when WhatsApp Web is fully loaded and ready.")
input("✅ Press ENTER to start sending messages...")

# 🔹 Read CSV
try:
    with open(csv_file, mode='r', encoding='utf-8') as file:
        reader = csv.DictReader(file)
        rows = [row for row in reader if row.get("PhoneNumber", "").strip() and row.get("Message", "").strip()]

    if not rows:
        print("📭 No valid data found in CSV.")
        input("Press Enter to exit...")
        exit()

    print(f"\n📄 Loaded {len(rows)} message(s). Sending...\n")

    for idx, row in enumerate(rows, start=1):
        phone = row["PhoneNumber"].strip()
        message = row["Message"].strip()

        print(f"📤 [{idx}/{len(rows)}] Sending to +91{phone}")

        # 🔍 Search contact in WhatsApp
        pyautogui.click(x=200, y=150)  # Click on Search bar (left sidebar)
        time.sleep(1)

        pyautogui.write(phone, interval=0.2)  # Type phone number
        time.sleep(2)

        # ⬇️ Press Down Arrow (in case search results appear)
        pyautogui.press('down')
        time.sleep(0.5)
        pyautogui.press('enter')  # Open chat
        time.sleep(3)  # Wait for chat to load

        # 💬 Copy and paste message
        pyperclip.copy(message)
        pyautogui.hotkey('ctrl', 'v')
        time.sleep(0.5)

        # 📤 Press Enter to send
        pyautogui.press('enter')
        print(f"✅ Sent to +91{phone}\n")

        # Delay before next
        time.sleep(5)

except Exception as e:
    print(f"❌ Error: {type(e).__name__}: {e}")

print("=" * 60)
print("🎉 All messages sent successfully!")
print("💡 You can now close the browser.")
print("=" * 60)
input("Press Enter to exit...")