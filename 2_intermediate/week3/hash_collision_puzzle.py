try:
    while True:
        txt = input("Enter a string: ")
        if len(txt) < 1:
            break

        hv = 0
        pos = 0
        for let in txt:
            pos = (pos % 3) + 1
            hv = (hv + (pos * ord(let))) % 1000000
            print("char", let, "char_ascii", ord(let), "curr_hash", hv, f"{pos=}")

        print(hv, txt)
except KeyboardInterrupt as e:
    print("\nBye", e)
