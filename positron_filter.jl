using DataFrames
using CSV
using MultivariateStats
using Plots
using Distributions
import Clustering
import StatsBase
#using Clustering

col_names = [ "hwid", "idx","x" , "y" , "z" , "r", "eta", "phi", "raw", "pid", "n", "truth_eta", "truth_phi", "truth_pt", "trk_good"," trk_barcode", "trk_pt" ]
a = "S:/STAT 196K/Final Project/data_samples/ff47d055-319b-4b12-91c3-a725c5d90856_nevts1_evtid00000134_graphcnn_2l_2j.csv"
# Exclamation is a push that will impose new changes on df2.
rename!(df0, col_names)
# Initiate some new columns
#electrons = DataFrame( eta1 = Float64[], phi1 = Float64[], pt1 = Float64[] )
#positrons = DataFrame( eta2 = Float64[], phi2 = Float64[], pt2 = Float64[] )
#jets = DataFrame( eta3 = Float64[], phi3 = Float64[], pt3 = Float64[] )

# Will us up for unfiltered positron data.
up = DataFrame( a1 = df0[:,"pid"], eta1 = df0[:,"truth_eta"], phi1 = df0[:,"truth_phi"], pt1 = df0[:,"truth_pt"] )
positrons = filter( up ) do row
        row.a1 == -11
end
select!( positrons, Not(:a1) )
array1 = Array( positrons )
nclusters = 2
k2 = Clustering.kmeans( array1, nclusters )
grp1 = k2.assignments .== 1
grp2 = k2.assignments .== 2
scatter( df0[grp1], df0[grp1], df0[grp1], label = "group 1")
#scatter!(eta1[grp2], phi1[grp2], pt1[grp2], label = "group 2")
