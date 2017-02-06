# -*- coding: utf-8 -*-
import os
import pickle
import numpy as np
#import matplotlib
#matplotlib.use('Agg')  # needed for the server only
import matplotlib.pyplot as plt


def get_simulations(a_dir):
    return [name for name in os.listdir(a_dir) if os.path.isdir(os.path.join(a_dir, name))]

#results_dir = '/Users/charatsoukala/Documents/14 month assessment/L2_pro-drop_simulation --PAPER/2016-09-15t15.20.18_npd_es_en_h30'
results_dir = '/Users/charatsoukala/Documents/14 month assessment/L2_pro-drop_simulation --PAPER/2016-09-15t15.42.00_enes_h30'
# read the results from all the simulations
results = []
for sim in get_simulations(results_dir):
    if sim.startswith(('0', '21', '62', '63', '71', '90', '97')):
        continue
    if os.path.isfile('%s/%s/results.out' % (results_dir, sim)):
        with open('%s/%s/results.out' % (results_dir, sim), 'r') as f:
            results.append(pickle.load(f))
    else:
        print 'Simulation #%s was problematic' % sim

num_valid_simulations = len(results)  # some might have been discarded
train_sentences = False
test_sentences = False
if results:
    simulations_with_pron_err = [simulation for simulation in results if sum(simulation[6]) > 0]
    number_of_all_pronoun_errors = len(simulations_with_pron_err)

    pro_drop_all = [simulation[-1] for simulation in results]

    # print number_of_all_pronoun_errors
    try:
        (epoch_list, num_correct, pos_correct, train_sentences, test_num_correct,
         test_pos_correct, all_pronoun_err, pronoun_err, test_sentences) = np.mean(results, axis=0)
    except:
        (epoch_list, num_correct, pos_correct, test_num_correct,
         test_pos_correct, all_pronoun_err, pronoun_err) = np.mean(results, axis=0)
    # take average of lists and plot
    epoch_list = range(0, len(epoch_list))
    if not train_sentences:  # already normalized
        plt.plot(epoch_list, num_correct, linestyle='--', color='olivedrab', label='train')
        #plt.plot(epoch_list, pos_correct, linestyle='--', color='yellowgreen',
        #         label='train POS')
        # add test sentences
        plt.plot(epoch_list, test_num_correct, color='darkslateblue', label='test')
        #plt.plot(epoch_list, test_pos_correct, color='deepskyblue', label='test POS')
        print test_num_correct
    else:
        plt.plot(epoch_list, np.true_divide(num_correct * 100, train_sentences), linestyle='--', color='olivedrab', label='train')
        #plt.plot(epoch_list, pos_correct * 100 / train_sentences, linestyle='--', color='yellowgreen',
        #         label='train POS')
        # add test sentences
        plt.plot(epoch_list, np.true_divide(test_num_correct * 100, test_sentences), color='darkslateblue', label='test')
        #plt.plot(epoch_list, test_pos_correct * 100 / test_sentences, color='deepskyblue', label='test POS')
        print np.true_divide(test_num_correct * 100, test_sentences)
        print 'perc'
    plt.ylim([0, 100])
    plt.xlabel('Epochs')
    plt.ylabel('Percentage correct (%)')
    # plt.title(args.title)
    plt.legend(loc='lower right', ncol=2, fancybox=True, shadow=True)
    plt.savefig('summary_%s_simulations.pdf' % num_valid_simulations)
    plt.close()

    if sum(all_pronoun_err) > 0:
        plt.title('Subject pronoun errors')
        plt.plot(epoch_list, all_pronoun_err, color='deepskyblue', linestyle='--')
        plt.plot(epoch_list, pronoun_err)
        plt.xlabel('Epochs')
        plt.ylabel('Mean errors')
        plt.savefig('summary_%s_pronoun_err.pdf' % num_valid_simulations)
        plt.close()
        # same using %
        with open(results_dir+'/input/test.enes') as f:
            testl = f.readlines()
        sentences_pronoun = len([line for line in testl if line.startswith('he ') or line.startswith('she ')])
        if sentences_pronoun:
            all_pronoun_err = np.true_divide(all_pronoun_err * 100, sentences_pronoun)
            pronoun_err_perc = np.true_divide(pronoun_err * 100, sentences_pronoun)
            #print pronoun_err
            print sentences_pronoun
            print pronoun_err_perc
            print '-----HERE'
        #other_sim = np.array([9.54497798,  2.85594464,  1.52652548,  0.54099392,  0.59970644,  0.03774376,
                              #0.04193751,  0.03355001,  0.03774376,  0.03774376 , 0.05871252 , 0.04193751,
                              #0.02516251,  0.02516251 , 0.03355001,  0.05451877,  0.06710002  ,0.05451877,
                             #0.07548752,  0.05451877])
        """pd_percentage = np.array([ 9.75024633  2.91736281  1.55935398  0.5526282   0.61260335  0.03855546
  0.0428394   0.03427152  0.03855546  0.03855546  0.05997515  0.0428394
  0.02570364  0.02570364  0.03427152  0.05569121  0.06854303  0.05569121
  0.07711091  0.05569121])"""

        npd_percentage = np.array([0., 0.00428394, 0., 0., 0., 0., 0.,
                                    0., 0., 0.11566637, 0., 0., 0.03427152,
                                    0.0214197, 0.03855546, 0.03855546, 0., 0., 0., 0.])
        #p rint all_pronoun_err
        #print pronoun_err
        #rest = all_pronoun_err - pronoun_err
        #print rest
        #plt.title("Percentage of subject pronoun errors (%%) for %s " % dualp.plot_title)
        #plt.plot(epoch_list, all_pronoun_err, color='deepskyblue', linestyle='--')
        plt.plot(epoch_list, npd_percentage)
        plt.plot(epoch_list, pronoun_err_perc, color='deepskyblue')
        plt.ylim([0, 40])
        plt.xlabel('Epochs')
        plt.ylabel('Mean errors %')
        plt.savefig('summary_%s_percentage_pronoun_err.pdf' % num_valid_simulations)
        plt.close()
        #plt.loglog(epoch_list, all_pronoun_err, color='deepskyblue', linestyle='--')
        #plt.loglog(epoch_list, pronoun_err)
        #plt.plot(epoch_list, all_pronoun_err, color='deepskyblue', linestyle='--')
        plt.plot(epoch_list, npd_percentage, color='yellowgreen', label='NPD_ES-EN')
        plt.plot(epoch_list, pronoun_err_perc, label='ES-EN')
        #plt.plot(epoch_list, rest, color='green')
        plt.ylabel('Mean % of gender errors')
        plt.xlabel('Epochs')
        #pyplot.title('arbitrary')
        # pyplot.xscale('log')
        plt.legend(loc='upper right', ncol=2, fancybox=True, shadow=True)
        plt.yscale('log', nonposy='clip')
        plt.ylim([10**-2, 10**1])
        #plt.set_ylim(ymin=0.1)
        #plt.ylim([10**-1, 10**4])
        plt.savefig('summary_%s_percentage_pronoun_err_log.pdf' % num_valid_simulations)
        plt.close()


"""import scipy.stats as stats
print pronoun_err
sample_size = 500

sample = np.random.choice(a= population_ages, size = sample_size)
sample_mean = sample.mean()

z_critical = stats.norm.ppf(q=0.95)  # Get the z-critical value*75
print("z-critical value:")              # Check the z-critical value
print(z_critical)

pop_stdev = population_ages.std()  # Get the population standard deviation

margin_of_error = z_critical * (pop_stdev/np.sqrt(sample_size))

confidence_interval = (sample_mean - margin_of_error,
                       sample_mean + margin_of_error)

print("Confidence interval:")
print(confidence_interval)"""
import scipy.stats as ss
"""
print pronoun_err_perc
pro_drop_percentage = np.array([ 9.54497798, 2.85594464, 1.52652548, 0.54099392, 0.59970644, 0.03774376
, 0.04193751, 0.03355001, 0.03774376, 0.03774376, 0.05871252, 0.04193751
, 0.02516251, 0.02516251, 0.03355001, 0.05451877, 0.06710002, 0.05451877
, 0.07548752, 0.05451877])

npd_percentage = np.array([[ 0., 0.00428394,  0., 0., 0., 0., 0.,
  0., 0., 0.11566637,  0., 0., 0.03427152,
  0.0214197,   0.03855546,  0.03855546, 0., 0., 0., 0.]])

n = 50000
npd = pronoun_err_perc
pd = pro_drop_percentage

#from uncertainties import ufloat

#p ± 1.96 * sqrt( (p*(1-p))/50000 )

#print ufloat(p, 1.96 * np.sqrt((p*(1-p))/50000 ))
#p + 1.96 * sqrt( (p*(1-p))/50000 )
#ci = (pd - npd) * 1.96 * np.sqrt((npd*(1-npd))/n+(pd*(1-pd)/n))
#print ci
#print np.nanmean(ci)

print npd
print '~~~'
print pd

#pro_drop_all = pd
print pro_drop_all
print sentences_pronoun
perc = np.array(pro_drop_all) * 100 / sentences_pronoun
print perc
print '---'
pro_drop_all = np.mean(perc, axis=0)
print pro_drop_all
#pro_drop_all = np.array(pro_drop_all)
plot_ci_plus = (pro_drop_all + 1.96 * np.sqrt((pro_drop_all*(1-pro_drop_all))/500))
plot_ci_minus = (pro_drop_all - 1.96 * np.sqrt((pro_drop_all*(1-pro_drop_all))/500))

print plot_ci_plus
print '---'
print plot_ci_minus
print '---'
#l2 = [range(0,20) for x in range(len(plot_ci_minus))]

#plt.plot(epoch_list, npd, color='yellowgreen', label='NPD_ES-EN')
plt.plot(epoch_list, pro_drop_all, label='ES-EN')
#plt.plot(epoch_list, (npd + 1.96 * np.sqrt((npd*(1-npd))/50000)), color='green')
#plt.plot(epoch_list, (npd - 1.96 * np.sqrt((npd*(1-npd))/50000)), color='green')
plt.plot(epoch_list, plot_ci_plus, color='deepskyblue')
plt.plot(epoch_list, plot_ci_minus, color='deepskyblue')
#plt.plot(epoch_list, upper, label='CI upper')
# plt.plot(epoch_list, rest, color='green')
plt.ylabel('Mean % gender errors')
plt.xlabel('Epochs')
# pyplot.title('arbitrary')
# pyplot.xscale('log')
plt.legend(loc='upper right', ncol=2, fancybox=True, shadow=True)
plt.yscale('log', nonposy='clip')
plt.ylim([10 ** -2, 10 ** 1])
# plt.set_ylim(ymin=0.1)
# plt.ylim([10**-1, 10**4])
plt.savefig('ci.pdf')
plt.close()
"""