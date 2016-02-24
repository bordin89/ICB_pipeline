#!/home/nicola/bin/python
#Nicola Bordin, CABD UPO
#Integrative Cell Biology Pipeline 2.0
#Executes scripts for automated analysis of proteomes
import sys,os,re,collections,argparse,glob,operator,subprocess,ConfigParser
from operator import itemgetter
parser = argparse.ArgumentParser(description='Integrative Cell Biology Pipeline')
print "\n"
print "+"+"-"*48+"+"
print "|"+" "*48+"|"
print "|"+" "*8+"Integrative Cell Biology Pipeline"+" "*7+"|"
print "|"+" "*48+"|"
print "|"+" "*13+"Nicola Bordin, CABD UPO"+" "*12+"|"
print "+"+"-"*48+"+"
#timestamp
import time
timestamp_1 = time.asctime().split(" ")[3]
print "Began work at {0}".format(timestamp_1)
#Argument parser
parser.add_argument("-o", "--output-directory", help="The directory where to write the output files. Defaults to WORKDIR.", metavar="PATH", default=".")
parser.add_argument("-i", "--i", help="The multiFASTA file to be processed. [mandatory]", metavar="PATH", required=True)
args=parser.parse_args()
arguments=args.input
current_path=os.getcwd()
#Execution options block
print "Modules available:\n"
print "PSIBLAST"
print "TMHMM"
print "SignalP"
print "IUPRED"
print "InterProScan"
print "HHPred"
print "HHblits\n"
print "Execution options\n\n"
config = ConfigParser.ConfigParser()
config.readfp(open(r'config.txt'))
blast_path = config.get('binaries', 'blast')
interproscan_path =config.get('binaries','interproscan')
tmhmm_path = config.get('binaries', 'tmhmm')
hhsuite_path =config.get('binaries','hhsuite')
swissprot_path = config.get('binaries', 'swissprot')
signalp_path =config.get('binaries','signalp')
iupred_path = config.get('binaries', 'iupred')

print interproscan_path
print blast_path
print tmhmm_path
print hhsuite_path
print swissprot_path
print signalp_path
print iupred_pat

#End timestamp
timestamp_2 = time.asctime().split(" ")[3]
print "\n\nEnded work at {0}\n".format(timestamp_2)