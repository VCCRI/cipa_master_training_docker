import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

def plot_histogram_single(x, name, xlabel, bins):
    if (len(x) == 0):
        return
    plt.rcParams.update({'font.size': 13})
    fig = plt.figure()
    ax = fig.add_subplot()
    n, b, patches = ax.hist(x, density=False, histtype='stepfilled', bins=bins)
    idx = np.where(n == n.max())
    b_max = (b[idx[0]] + b[idx[0]+1])/2
    ax.set_title("n = %s, x_peak = %.1e, mean = %.1e" %(len(x), b_max,
                 x.mean()), fontsize=13)
    ax.set_ylabel("Frequency")
    ax.set_xlabel(xlabel)
    plt.grid(color='gray', alpha=0.5, linestyle='-', linewidth='0.5')
    plt.savefig(name + ".png")

df = pd.read_csv("quinidine_boot_pars.csv")
for col in df.columns:
    x = df[col].to_numpy()
    plot_histogram_single(x, col, col, 200)
