DATA prescription; 
  INPUT rate X1-X13; 
  LABEL rate = 'Crime Rate defined as the number of offences known to the police per 1,000,000 population'
		X1 = 'Number of males aged 14-24 years per 1000 of total state population'
		X2 = 'Binary variable distinguishing Southern states (S=1) from the rest'
		X3 = 'Educational level'
		X4 = 'Police expenditure in 1960'
		X5 = 'Police expenditure in 1959'
		X6 = 'Labour force participation rate per 1000 civilian males in the age group 14-24 years'
		X7 = 'Number of males per 1000 females'
		X8 = 'State population size in hundred thousands.'
		X9 = 'Number of non-white people per 1000.'
		X10 = 'Unemployment rate of urban males per 1000 in the age group 14-24 years'
		X11 ='Unemployment rate of urban males per 1000 in the age group 35-39 years'
		X12 ='Wealth as measured by family income (unit: 10 dollars)'
		X13 = 'Income inequality expressed as the number of families per 1000 earning below one-half of the median income.';
  DATALINES;
79.1	151	1	91	58	56	510	950		33	301	108	41	394	261
163.5	143	0	113	103	95	583	1012	13	102	96	36	557	194
57.8	142	1	89	45	44	533	969		18	219	94	33	318	250
196.9	136	0	121	149	141	577	994		157	80	102	39	673	167
123.4	141	0	121	109	101	591	985		18	30	91	20	578	174
68.2	121	0	110	118	115	547	964		25	44	84	29	689	126
96.3	127	1	111	82	79	519	982		4	139	97	38	620	168
155.5	131	1	109	115	109	542	969		50	179	79	35	472	206
85.6	157	1	90	65	62	553	955		39	286	81	28	421	239
70.5	140	0	118	71	68	632	1029	7	15	100	24	526	174
167.4	124	0	105	121	116	580	966		101	106	77	35	657	170
84.9	134	0	108	75	71	595	972		47	59	83	31	580	172
51.1	128	0	113	67	60	624	972		28	10	77	25	507	206
66.4	135	0	117	62	61	595	986		22	46	77	27	529	190
79.8	152	1	87	57	53	530	986		30	72	92	43	405	264
94.6	142	1	88	81	77	497	956		33	321	116	47	427	247
53.9	143	0	110	66	63	537	977		10	6	114	35	487	166
92.9	135	1	104	123	115	537	978		31	170	89	34	631	165
75.0	130	0	116	128	128	536	934		51	24	78	34	627	135
122.5	125	0	108	113	105	567	985		78	94	130	58	626	166
74.2	126	0	108	74	67	602	984		34	12	102	33	557	195
43.9	157	1	89	47	44	512	962		22	423	97	34	288	276
121.6	132	0	96	87	83	564	953		43	92	83	32	513	227
96.8	131	0	116	78	73	574	1038	7	36	142	42	540	176
52.3	130	0	116	63	57	641	984		14	26	70	21	486	196
199.3	131	0	121	160	143	631	1071	3	77	102	41	674	152
34.2	135	0	109	69	71	540	965		6	4	80	22	564	139
121.6	152	0	112	82	76	571	1018	10	79	103	28	537	215
104.3	119	0	107	166	157	521	938		168	89	92	36	637	154
69.6	166	1	89	58	54	521	973		46	254	72	26	396	237
37.3	140	0	93	55	54	535	1045	6	20	135	40	453	200
75.4	125	0	109	90	81	586	964		97	82	105	43	617	163
107.2	147	1	104	63	64	560	972		23	95	76	24	462	233
92.3	126	0	118	97	97	542	990		18	21	102	35	589	166
65.3	123	0	102	97	87	526	948		113	76	124	50	572	158
127.2	150	0	100	109	98	531	964		9	24	87	38	559	153
83.1	177	1	87	58	56	638	974		24	349	76	28	382	254
56.6	133	0	104	51	47	599	1024	7	40	99	27	425	225
82.6	149	1	88	61	54	515	953		36	165	86	35	395	251
115.1	145	1	104	82	74	560	981		96	126	88	31	488	228
88.0	148	0	122	72	66	601	998		9	19	84	20	590	144
54.2	141	0	109	56	54	523	968		4	2	107	37	489	170
82.3	162	1	99	75	70	522	996		40	208	73	27	496	224
103.0	136	0	121	95	96	574	1012	29	36	111	37	622	162
45.5	139	1	88	46	41	480	968		19	49	135	53	457	249
50.8	126	0	104	106	97	599	989		40	24	78	25	593	171
84.9	130	0	121	90	91	623	1049	3	22	113	40	588	160
RUN;
PROC GPLOT DATA=prescription; /* obtaining the scatter diagrams with the response variable y */
PLOT rate * (X1-X13);
RUN;
PROC CORR DATA=prescription; /* obtaining the correlation coefficients and their respective p-values */
VAR rate X1-X13;
RUN;
PROC REG DATA=prescription; /* obatining the best final regression models from each of the Variable Selection methods */
MODEL rate = X1-X13/SELECTION = FORWARD SLENTRY = 0.05;
MODEL rate = X1-X13/SELECTION = BACKWARD SLENTRY = 0.05;
MODEL rate = X1-X13/SELECTION = STEPWISE SLENTRY = 0.05;
RUN;



