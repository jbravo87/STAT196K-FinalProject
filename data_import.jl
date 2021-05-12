using DataFrames
using CSV

#column_names = DataFrame( hwid =Int64[], idx = Int32[], x = Float64[], y = Float64[], z = Float64[], r = Float64[], eta = Float64[], phi = Float64[], raw = Float64[], pid = Int[], n = Int32[], truth_eta = Float64[], truth_phi = Float64[], truth_pt = Float64[], trk_good = Float64[], trk_barcode = Float64[], trk_pt = Float64[] )
column_names = [ "hwid", "idx","x" , "y" , "z" , "r", "eta", "phi", "raw", "pid", "n", "truth_eta", "truth_phi", "truth_pt", "trk_good"," trk_barcode", "trk_pt" ]

df2 = DataFrame(CSV.File("S:/STAT 196K/Final Project/data_samples/ff3bfb52-f56f-47dd-8dab-0b658e171af5_nevts1_evtid00000140_graphcnn_4l_0j.csv", header = false ))

# Want to see the column corresponding to the truth label of the object.
a = df2[ : , 10 ]

b = df2[:,11]

# Exclamation is a push that will impose new changes on df2.
rename!(df2, column_names)
