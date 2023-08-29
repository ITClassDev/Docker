with open("/home/stephan/Progs/ShTP/Backend/.env") as fd:
    data = fd.read()

for line in data.split("\n"):
    if line and not line.startswith("#"):
        a = line.split("=")
        print(f"{a[0]}: {a[1]}")
