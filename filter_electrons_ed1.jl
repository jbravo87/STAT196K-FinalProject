using DataFrames
using CSV
using MultivariateStats
using Plots
using Distributions

col_names = [ "hwid", "idx","x" , "y" , "z" , "r", "eta", "phi", "raw", "pid", "n", "truth_eta", "truth_phi", "truth_pt", "trk_good"," trk_barcode", "trk_pt" ]
a = "S:/STAT 196K/Final Project/data_samples/ff47d055-319b-4b12-91c3-a725c5d90856_nevts1_evtid00000022_graphcnn_2l_1j.csv"
df0 = DataFrame(CSV.File( a , header = false ) )
# Exclamation is a push that will impose new changes on df2.
rename!(df0, col_names)
# Initiate some new columns
#electrons = DataFrame( eta1 = Float64[], phi1 = Float64[], pt1 = Float64[] )
#positrons = DataFrame( eta2 = Float64[], phi2 = Float64[], pt2 = Float64[] )
#jets = DataFrame( eta3 = Float64[], phi3 = Float64[], pt3 = Float64[] )

#eta1 = DataFrame( a0 = Float64[] )

unfltrd_electrons = DataFrame( a1 = df0[ :,"pid"], eta1 = df0[:,"truth_eta"], phi1 = df0[:,"truth_phi"], pt1 = df0[:,"truth_pt"] )
#fltrd_electrons = filter( unfltrd_electrons) do row
#        row.a1 == 11
#end
electrons = filter( unfltrd_electrons) do row
        row.a1 == 11
end
select!( electrons, Not(:a1) )
