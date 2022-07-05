--  _  _ ___
-- | || | __|   H
-- | __ | _|    A
-- |_||_|___|   P
--

function TermWrapRun(wrapandrun)
	if not split_style then
		split_style = 'v'
	end

	if split_style == 'v' then
		buffercmd = '50vnew'
	elseif split_style == 'h' then
		buffercmd = '15new'
	else
		print("ERROR! split_style is not a valid value (must be 'h' or 'v')\n")
	end

	print(wrapandrun)

end

split_style = 'v'

TermWrapRun("This is test")
