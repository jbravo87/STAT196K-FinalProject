using DataFrames
using CSV
using MultivariateStats
using Plots
using Distributions
import Clustering
import StatsBase

col_names = [ "hwid", "idx","x" , "y" , "z" , "r", "eta", "phi", "raw", "pid", "n", "truth_eta", "truth_phi", "truth_pt", "trk_good"," trk_barcode", "trk_pt" ]
a = "S:/STAT 196K/Final Project/data_samples/ff47d055-319b-4b12-91c3-a725c5d90856_nevts1_evtid00000134_graphcnn_2l_2j.csv"

# Exclamation is a push that will impose new changes on df2.
rename!(df0, col_names)

# Will us up for unfiltered positron data.
unfiltered_positrons = DataFrame( a1 = df0[:,"pid"], eta1 = df0[:,"truth_eta"], phi1 = df0[:,"truth_phi"], pt1 = df0[:,"truth_pt"] )
idx = ( unfiltered_positrons.a1 .== -11 )
# Filtered positrons.
eta2 = unfiltered_positrons[ idx, :eta1 ]
phi2 = unfiltered_positrons[ idx, :phi1 ]
pt2 = unfiltered_positrons[ idx, :pt1 ]

positrons = DataFrame( eta = eta2, phi = phi2, pt = pt2 )
array1 = Array( positrons )
xyz = transpose( array1 )
nclusters = 2
k2 = Clustering.kmeans( xyz, nclusters )
grp1 = k2.assignments .== 1
grp2 = k2.assignments .== 2
scatter( eta2[grp1], phi2[grp1], pt2[grp1], label = "group 1")
#scatter!(eta1[grp2], phi1[grp2], pt1[grp2], label = "group 2")
