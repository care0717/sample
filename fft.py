import numpy as np

def main():
    # CSVのロード
    data = np.genfromtxt("tek0037CH4.csv",delimiter=",", skip_header=1, dtype='float')
    # 5行目を抽出(日経平均株価の終値)
    f = data[:,2]
    # 高速フーリエ変換
    F = np.fft.fft(f)
    print(F)

if __name__ == "__main__":
    main()
