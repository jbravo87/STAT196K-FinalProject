extract_positron

x0 = "S:/STAT 196K/Final Project/data_samples/83e1f7fb-f4e3-4e54-88d8-a66ed8ebd8a6_nevts1_evtid00000102_graphcnn_4l_0j.csv"
x1 = "S:/STAT 196K/Final Project/data_samples/84b56e9c-3025-48d4-a295-961f5848c2fc_nevts1_evtid00000053_graphcnn_2l_3j.csv"
x2 = "S:/STAT 196K/Final Project/data_samples/ff3bfb52-f56f-47dd-8dab-0b658e171af5_nevts1_evtid00000002_graphcnn_3l_0j.csv"
x3 = "S:/STAT 196K/Final Project/data_samples/ff3bfb52-f56f-47dd-8dab-0b658e171af5_nevts1_evtid00000095_graphcnn_4l_0j.csv"
x4 = "S:/STAT 196K/Final Project/data_samples/ff3bfb52-f56f-47dd-8dab-0b658e171af5_nevts1_evtid00000140_graphcnn_4l_0j.csv"
x5 = "S:/STAT 196K/Final Project/data_samples/ff47d055-319b-4b12-91c3-a725c5d90856_nevts1_evtid00000022_graphcnn_2l_1j.csv"
x6 = "S:/STAT 196K/Final Project/data_samples/ff47d055-319b-4b12-91c3-a725c5d90856_nevts1_evtid00000090_graphcnn_2l_2j.csv"
x7 = "S:/STAT 196K/Final Project/data_samples/ff47d055-319b-4b12-91c3-a725c5d90856_nevts1_evtid00000134_graphcnn_2l_2j.csv"
x8 = "S:/STAT 196K/Final Project/data_samples/ff311db1-3f73-4118-8740-1590883750d8_nevts1_evtid00000102_graphcnn_4l_0j.csv"
collection = [ x0, x1, x2, x3, x4, x5, x6, x7, x8 ]
plotly()
plots = map( extract_positron, collection )
