function onClick_l2r(l1, l2)
{
	for(var i=0; i<l1.options.length; i++)
		if(l1.options[i].selected)
			l2.options.add(l1.options[i--]);
}

function onClick_r2l(l1, l2)
{
	for(var i=0; i<l2.options.length; i++)
		if(l2.options[i].selected)
			l1.options.add(l2.options[i--]);
}

function onClick_moveUp(l2)
{
	for (var i = 0; i < l2.options.length; i++)
		if (i > 0 && l2.options[i].selected == true
				&& l2.options[i - 1].selected == false) {
			l2.add(l2.options[i], l2[i - 1]);
			l2.options[i - 1].selected = true;
			l2.options[i].selected = false;
		}
}

function onClick_moveDn(l2)
{
	for (var i = l2.options.length - 1; i >= 0; i--)
		if (i < l2.options.length - 1 && l2.options[i].selected == true
				&& l2.options[i + 1].selected == false) {
			l2.add(l2.options[i + 1], l2[i]);
			l2.options[i].selected = false;
			l2.options[i + 1].selected = true;
		}
}

function onClick_selectAll(l2)
{
	for(var i=0; i<l2.options.length; i++)
		l2.options[i].selected=true;
}

function onClick_t2s(text, l2)
{
	e=document.createElement("option");
	e.text=text;
	l2.add(e);
}

function onClick_del(l2)
{
	for(var i=l2.options.length-1; i>=0; i--)
		if(l2.options[i].selected)
			l2.remove(i);
}