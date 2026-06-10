from pathlib import Path


path = Path("tmp-python-file.txt")

path.write_text("Ada\nGrace\nLinus\n")

lines = path.read_text().splitlines()
uppercased = [line.upper() for line in lines]

print(lines)
print(uppercased)

print("---")

with path.open("a") as file:
    file.write("Matz\n")

for line in path.read_text().splitlines():
    print(f"- {line}")

path.unlink()
