cs_percentag = [0.0, 0.29599999999999999, 0.57599999999999996, 0.52800000000000002, 0.46399999999999997, 0.64000000000000001, 0.59199999999999997, 0.65600000000000003, 0.74399999999999999, 0.80000000000000004, 0.76800000000000002, 0.76000000000000001, 0.85599999999999998, 0.84799999999999998, 0.82399999999999995, 0.93600000000000005, 0.96799999999999997, 0.98399999999999999, 0.98399999999999999, 1.024]


type_cs_ES = [(0.078222222222222235, 0.026067339197538099),
              (0.073777777777777789, 0.023934065809486687),
              (0.0057777777777777784, 0.0044666113871648407),
              (0.012444444444444445, 0.015370325747369408),
              (0.18977777777777777, 0.055924110836378126),
              (0.0026666666666666666, 0.00),
              (0.0093333333333333358, 0.0076594168620507056),
              (0.064000000000000001, 0.03818085616873694),
              (0.0017777777777777779, 0.0033259176771323925)]
type_cs_EN = [(0.0080000000000000002, 0.010994948334980428),
              (0.0013333333333333333, 0.00),
              (0.0093333333333333341, 0.010749676997731401),
              (0.00044444444444444447, 0.0018324913891634047),
              (0.14888888888888893, 0.053475735815299019),
              (0.16355555555555557, 0.028624430556630432),
              (0.0044444444444444453, 0.0039752319599996259),
              (0.00088888888888888893, 0.00),
              (0.00044444444444444447, 0.0018324913891634047)]


labels = ['det borrow', 'verb-suffix borrow', 'inter-word switch', 'to borrow', 'intra-sentential', 'noun borrow',
          'verb borrow', '-ing borrow', 'aux borrow']

allowed = ['verb-suffix borrow', 'intra-sentential', 'noun borrow', 'verb borrow', '-ing borrow', 'other']
# early bilingual:

type_cs_ES_early = [(0.19155555555555559, 0.031492895534323329),
              (0.5471111111111111, 0.090750505899348327),
              (0.75911111111111118, 0.12771882698111545),
              (0.22177777777777777, 0.050723165380059228),
              (4.4497777777777783, 0.55696674103332589),
              (0.56622222222222229, 0.15102742780904824),
              (0.35244444444444445, 0.075682246723626029),
              (0.47688888888888886, 0.04581228472908512),
              (0.056444444444444457, 0.015882283009071674)]
type_cs_EN_early = [(0.73066666666666658, 0.16825377657970514),
              (0.37199999999999994, 0.16093615021008936),
              (0.61644444444444446, 0.17159066998147471),
              (0.0075555555555555558, 0.0072894308741585454),
              (3.0600000000000001, 0.60226682901628681),
              (0.51511111111111108, 0.069442933316892094),
              (0.18133333333333335, 0.052931821976744564),
              (0.63111111111111118, 0.2158005480604947),
              (0.16755555555555557, 0.062508863569028017)]

type_EN = []
type_ES = []
other_EN = []
other_ES = []
for i, item in enumerate(labels):
    if item in allowed:
        type_EN.append(type_cs_EN[i])
        type_ES.append(type_cs_ES[i])
    else:
        other_EN.append(type_cs_EN[i])
        other_ES.append(type_cs_ES[i])
type_EN.append((sum([x for x, y in other_EN]), 0))
type_ES.append((sum([x for x, y in other_ES]), sum([y for x, y in other_ES])))
print other_EN
print other_ES




import numpy as np
import matplotlib.pyplot as plt

ind = np.arange(len(allowed))  # the x locations for the groups
width = 0.35  # the width of the bars

fig, ax = plt.subplots()
rects_EN = ax.bar(ind, [x[0] for x in type_EN], width, color='r',
                  yerr=[x[1] for x in type_EN])
rects_ES = ax.bar(ind + width, [x[0] for x in type_ES], width, color='y',
                  yerr=[x[1] for x in type_ES])

# add some text for labels, title and axes ticks
label = 'Types of code-switches (% of test set)'
ax.set_ylabel(label)
#ax.set_title('Early Spanish-English bilingual model')
ax.set_title('Late Spanish-English bilingual model (L1 Spanish)')
ax.set_xticks(ind + width / 2)
ax.legend((rects_EN[0], rects_ES[0]), ('EN', 'ES'))
ax.set_xticklabels(allowed, rotation=55)  # rotate labels to fit better
plt.tight_layout()  # make room for labels
plt.savefig('/Users/charatsoukala/dual_path/late.png')
plt.close()
