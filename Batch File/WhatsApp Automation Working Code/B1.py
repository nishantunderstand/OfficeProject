import pywhatkit as kit
import time
import csv
import os

# ===================================
# 🔧 CONFIGURATION: Change these as needed
# ===================================
CSV_FILE_PATH = r"C:\Users\User\Downloads\WhatsAppAutomation - 2025.csv"
COUNTRY_CODE = "+91"
WAIT_TIME = 15        # Time to wait for WhatsApp Web to load
BETWEEN_MSG_DELAY = 15  # Delay between messages (reduce risk of block)

# Optional: Enable logging to a file
LOG_TO_FILE = True
LOG_FILE = "whatsapp_automation_log.txt"

# Normalize path for consistent handling
CSV_FILE_PATH = os.path.normpath(CSV_FILE_PATH)

print("=" * 50)
print("🚀 WhatsApp Message Automation Started")
print("=" * 50)

# 🔹 Set up logger (optional file output)
if LOG_TO_FILE:
    log_output = open(LOG_FILE, "w", encoding="utf-8")
    log_output.write("WhatsApp Automation Log\n")
    log_output.write("=" * 50 + "\n")

def log_print(message):
    print(message)
    if LOG_TO_FILE:
        log_output.write(message + "\n")

# 🔹 Validate if file exists
if not os.path.exists(CSV_FILE_PATH):
    error_msg = f"❌ Error: CSV file not found at '{CSV_FILE_PATH}'"
    log_print(error_msg)
    log_print("Please check the file path and try again.")
    if LOG_TO_FILE:
        log_output.close()
    exit(1)

# 🔹 Read contacts from CSV
contacts = []
try:
    with open(CSV_FILE_PATH, mode="r", encoding="utf-8", newline="", errors="ignore") as file:
        reader = csv.DictReader(file)
        if "PhoneNumber" not in reader.fieldnames or "Message" not in reader.fieldnames:
            log_print("❌ Error: CSV must have headers 'PhoneNumber' and 'Message'")
            exit(1)

        for row_num, row in enumerate(reader, start=2):
            phone = str(row["PhoneNumber"]).strip() if row["PhoneNumber"] else ""
            message = row["Message"].strip() if row["Message"] else ""

            # Skip if phone is empty
            if not phone:
                log_print(f"🟡 Skipped row {row_num}: Empty phone number")
                continue

            # Validate phone contains only digits
            if not phone.isdigit():
                log_print(f"❌ Skipped row {row_num}: Non-digit phone number: {phone}")
                continue

            # Skip if message is empty
            if not message:
                log_print(f"🟡 Skipped row {row_num}: Empty message for phone: {phone}")
                continue

            full_phone = f"{COUNTRY_CODE}{phone}"
            contacts.append((full_phone, message))
            log_print(f"✅ Queued: {full_phone} → '{message[:30]}...'")  # Truncate long messages

except Exception as e:
    log_print(f"❌ Error reading CSV file: {e}")
    if LOG_TO_FILE:
        log_output.close()
    exit(1)

# 🔹 Send messages
if not contacts:
    log_print("📭 No valid contacts to send messages to.")
else:
    log_print(f"\n📬 Found {len(contacts)} valid message(s) to send. Starting...\n")
    print("")  # Blank line in console for readability

    for i, (phone_number, message) in enumerate(contacts, 1):
        log_print(f"📨 [{i}/{len(contacts)}] Sending to {phone_number}...")
        try:
            kit.sendwhatmsg_instantly(
                phone_no=phone_number,
                message=message,
                wait_time=WAIT_TIME,
                tab_close=True
            )
            time.sleep(BETWEEN_MSG_DELAY)  # Delay to avoid spam detection
        except Exception as e:
            log_print(f"❌ Failed to send to {phone_number}: {str(e)}")

log_print("-" * 50)
log_print("✅ Automation complete. All messages processed.")
log_print("-" * 50)

# Close log file
if LOG_TO_FILE:
    log_output.close()
    log_print(f"📄 Log saved to: {LOG_FILE}")