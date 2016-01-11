'Author: James Lamb, Abbott Labs

'Motivation: Estimate a few models of US industrial production.

'##########################################################################################################

		
		'Create workfile
		wfcreate(page = DATA_M) q 1920 2020 'wf=CV_EXAMPLE, 
		
		'Fetch data
		'fetch(d=FRED) gdpr cpi
		'fetch(d="USMACRO_MODCON") gdpr.q cpi.q
		fetch(d=FRED) INDPRO CPIAUCSL
		
		'Estimate a few differerent models
		'equation eq_01.ls d(gdpr) c ar(1) @trend
		'equation eq_02.ls d(gdpr) c ar(1) ar(2) ma(1)
		'equation eq_03.ls gdpr c @trend @trend^2
		
		
		equation eq_01.ls d(indpro) c ar(1)
		equation eq_02.ls d(indpro) c ar(1) ar(2) ma(1)
		equation eq_03.ls indpro c @trend @trend^2

		%eqs = @wlookup("EQ_*", "equation") + " " + @wlookup("VAR_*", "var")
		
		eq_01.tscval
		

'##########################################################################################################

