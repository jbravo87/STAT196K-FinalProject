# Import necessary libraries.
using DataFrames
using CSV

x0 = "S:/STAT 196K/Final Project/data_samples/83e1f7fb-f4e3-4e54-88d8-a66ed8ebd8a6_nevts1_evtid00000102_graphcnn_4l_0j.csv"
x1 = "S:/STAT 196K/Final Project/data_samples/84b56e9c-3025-48d4-a295-961f5848c2fc_nevts1_evtid00000053_graphcnn_2l_3j.csv"
x2 = "S:/STAT 196K/Final Project/data_samples/ff3bfb52-f56f-47dd-8dab-0b658e171af5_nevts1_evtid00000002_graphcnn_3l_0j.csv"
x3 = "S:/STAT 196K/Final Project/data_samples/ff3bfb52-f56f-47dd-8dab-0b658e171af5_nevts1_evtid00000095_graphcnn_4l_0j.csv"
x4 = "S:/STAT 196K/Final Project/data_samples/ff3bfb52-f56f-47dd-8dab-0b658e171af5_nevts1_evtid00000140_graphcnn_4l_0j.csv"
x5 = "S:/STAT 196K/Final Project/data_samples/ff47d055-319b-4b12-91c3-a725c5d90856_nevts1_evtid00000022_graphcnn_2l_1j.csv"
x6 = "S:/STAT 196K/Final Project/data_samples/ff47d055-319b-4b12-91c3-a725c5d90856_nevts1_evtid00000090_graphcnn_2l_2j.csv"
x7 = "S:/STAT 196K/Final Project/data_samples/ff47d055-319b-4b12-91c3-a725c5d90856_nevts1_evtid00000134_graphcnn_2l_2j.csv"
x8 = "S:/STAT 196K/Final Project/data_samples/ff311db1-3f73-4118-8740-1590883750d8_nevts1_evtid00000102_graphcnn_4l_0j.csv"

col_names = [ "hwid", "idx","x" , "y" , "z" , "r", "eta", "phi", "raw", "pid", "n", "truth_eta", "truth_phi", "truth_pt", "trk_good"," trk_barcode", "trk_pt" ]
# The various data frames for the different data samples.
df0 = DataFrame(CSV.File( x0 , header = false ))
df1 = DataFrame(CSV.File( x1 , header = false ))
df2 = DataFrame(CSV.File( x2 , header = false ))
df3 = DataFrame(CSV.File( x3 , header = false ))
df4 = DataFrame(CSV.File( x4 , header = false ))
df5 = DataFrame(CSV.File( x5 , header = false ))
df6 = DataFrame(CSV.File( x6 , header = false ))
df7 = DataFrame(CSV.File( x7 , header = false ))
df8 = DataFrame(CSV.File( x8 , header = false ))

# Count the unique elements in the column
u = unique( df6[ :, "pid" ] )
d=Dict([(i,count(x->x==i,y)) for i in u])
# The count of positrons.
println("count for -11 is $(d[-11])")
