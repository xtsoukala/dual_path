from elman_network import np  # or import it from numpy directly?
import matplotlib

matplotlib.use('Agg')  # needed for the server only
import matplotlib.pyplot as plt


def percentage(x, total):
    return np.true_divide(x * 100, total)

num_test = 500
num_train = 2000
epochs = range(30)

cs_early = [0.0, 4.246666666666667, 13.533333333333333, 14.386666666666668, 14.84, 16.106666666666666, 17.646666666666668, 18.226666666666667, 19.260000000000002, 19.32, 19.68, 19.573333333333331, 19.780000000000001, 19.813333333333333, 19.84, 20.199999999999999, 20.306666666666668, 20.379999999999999, 20.666666666666664, 20.453333333333333, 20.826666666666668, 20.953333333333333, 21.193333333333332, 21.313333333333333, 21.453333333333333, 21.393333333333331, 21.553333333333331, 21.366666666666664, 21.886666666666667, 21.706666666666667]
cs_late = [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0, 1.3133333333333332, 1.2666666666666666, 1.3400000000000001, 1.52, 1.6399999999999997, 1.7, 1.6000000000000001, 1.6533333333333335, 1.8533333333333335, 1.8066666666666666, 2.1733333333333333, 2.2066666666666666, 2.1933333333333334, 2.3066666666666666]

plt.plot(epochs, cs_early, color='olivedrab', linewidth=2,
         label="Early bilinguals")
plt.plot(epochs, cs_late, linewidth=2,
         color='darkslateblue', label="Late bilinguals")
plt.xlabel('Epochs')
plt.ylabel('Percentage of code-switches')
plt.ylim([0, 25])
plt.xlim(0, max(epochs))
plt.legend(loc='upper right', ncol=2, fancybox=True, shadow=True)
fname = 'code_switches_percentage.pdf'
plt.savefig(fname)
plt.close()
