import pandas as pd
def print_hi():
    for i in range(0, 5):
        pd.DataFrame({"A": [1,2,3]}, index=[0,1,2]).to_csv(f"./data/{i}.csv")
    pd.read_csv("./data/5.csv").to_csv("./data/6.csv")
    print("Hello world!")



# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    print_hi()

