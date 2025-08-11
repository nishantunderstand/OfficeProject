import csv
from datetime import datetime
import speedtest

def run_speed_test():
    st = speedtest.Speedtest()
    st.get_best_server()
    download = round(st.download() / 1_000_000, 2)
    upload = round(st.upload() / 1_000_000, 2)
    ping = st.results.ping
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    data = [timestamp, download, upload, ping]
    filename = "ookla_speed_results.csv"

    try:
        with open(filename, 'x', newline='') as f:
            writer = csv.writer(f)
            writer.writerow(["Timestamp", "Download (Mbps)", "Upload (Mbps)", "Ping (ms)"])
    except FileExistsError:
        pass

    with open(filename, 'a', newline='') as f:
        writer = csv.writer(f)
        writer.writerow(data)

if __name__ == "__main__":
    run_speed_test()
