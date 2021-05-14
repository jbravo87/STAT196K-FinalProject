using DataFrames
using CSV
using MultivariateStats
using Plots
using Distributions
import Clustering
import StatsBase

# Argument of function is some CSV file.
function extract_positron( csv_file )
  col_names = [ "hwid", "idx","x" , "y" , "z" , "r", "eta", "phi", "raw", "pid", "n", "truth_eta", "truth_phi", "truth_pt", "trk_good"," trk_barcode", "trk_pt" ]
  raw_df = DataFrame( CSV.File( csv_file , header = false ) )
  # Exclamation is a push that will impose new changes on df2.
  rename!( raw_df, col_names )
  # This gave me my the raw data frame correctly formatted.

  # Fill manually pick out the columns of interest.
  # pid = particle id?
  w = raw_df[ : , "pid" ]
  x = raw_df[ : , "truth_eta" ]
  y = raw_df[ : , "truth_phi"]
  z = raw_df[ : , "truth_pt" ]

  # unfiltered positron data.
  # id is the variable name to identify it as an electron, positron, jet, or background noice.
  unfiltered_positrons = DataFrame( id = w, eta1 = x , phi1 = y , pt1 = z )
  idx = ( unfiltered_positrons.id .== -11 )
  # Filtered positrons.
  eta2 = unfiltered_positrons[ idx, :eta1 ]
  phi2 = unfiltered_positrons[ idx, :phi1 ]
  pt2 = unfiltered_positrons[ idx, :pt1 ]

  positrons = DataFrame( eta = eta2, phi = phi2, pt = pt2 )
  array1 = Array( positrons )
  xyz = transpose( array1 )

  # Will use k=2 for the k-means
  nclusters = 2
  k2  = Clustering.kmeans( xyz, nclusters )
  grp1 = k2.assignments .== 1
  grp2 = k2.assignments .== 2
  plotly()
  scatter( eta2[grp1], phi2[grp1], pt2[grp1], label = "group 1")
  scatter!( eta2[grp2], phi2[grp2], pt2[grp2], label = "group 2")

end
