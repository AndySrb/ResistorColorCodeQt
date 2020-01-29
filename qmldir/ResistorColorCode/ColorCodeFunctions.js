var unitPrefix = [ "p", "n", "µ", "m", "","k","M","G","T"]

function getNumerator(colorsArray,inColor,counter)
{
    for (var i = 0; i <= counter;i++)
    {
        if (colorsArray[i] == inColor)
        {
            return i;
        }
    }
}

function doCalculations(selector)
{
    switch (selector)
    {
    case 0:
        calc4color();
        break;
    case 1:
        calc5color();
        break;
    }
}

function calc4color()
{
    var doCalculation = true;

    for (var i = 0; i < 2; i++) {
        if (_4colorResistor.itemAt(i).selectedColor === -1)
            doCalculation = false
    }
    if (toleranceColorCode.selectedColor == -1)
        doCalculation = false

    if (doCalculation)
    {
        var result = 0;
        result = _4colorResistor.itemAt(0).selectedColor * 10;
        result = result +_4colorResistor.itemAt(1).selectedColor ;
        result = result * Math.pow(10,_4colorResistor.itemAt(2).selectedColor);


        var final_result = fixPrefix([result,4]);

        resistance4color.text = final_result[0] + unitPrefix[final_result[1]] + "Ω ±" + toleranceColorCode.tolerance[toleranceColorCode.selectedColor] + "%";
    }
}


function calc5color()
{
    var doCalculation = true;

    for (var i = 0; i < 3; i++)
    {
        if (_5colorResistor.itemAt(i).selectedColor === -1)
            doCalculation = false
    }

    if (doCalculation)
    {
        var result = 0;
        result = _5colorResistor.itemAt(0).selectedColor * 100;
        result = result + (_5colorResistor.itemAt(1).selectedColor * 10) ;
        result = result + _5colorResistor.itemAt(2).selectedColor;
        result = result * Math.pow(10,_5colorResistor.itemAt(3).selectedColor);

        console.log(result);
        var final_result = fixPrefix([result,4]);
        resistance5color.text = final_result[0] + unitPrefix[final_result[1]] + "Ω ±" + "1" + "%";
    }
}

function updateBands(selector)
{
    switch (selector)
    {
    case 1:
        for (var i = 0; i < 4; i++)
        {
            if (_5colorResistor.itemAt(i).selectedColor !== -1)
            {
                colorBands5Color.itemAt(i).label.text = "";
                colorBands5Color.itemAt(i).color = colors[_5colorResistor.itemAt(i).selectedColor];
            }
        }
        break;
     case 0:
        for (var i = 0; i < 3; i++)
        {
            if (_4colorResistor.itemAt(i).selectedColor !== -1)
            {
                colorBands4Color.itemAt(i).label.text ="";
                colorBands4Color.itemAt(i).color = colors[_4colorResistor.itemAt(i).selectedColor];
            }
        }
         break;
    }
}

function updateToleranceBand()
{
    if (toleranceColorCode.selectedColor !== -1)
    {
    colorBands4Color.itemAt(3).label.text ="";
    colorBands4Color.itemAt(3).color = toleranceColorCode.toleranceColors[toleranceColorCode.selectedColor];
    }
}

function fixPrefix(val)
{
    var value = val;
    if (value[0] === 0)
    {
        value[0] = 0;
        value[1] = -4;
        return value
    }
    if (isFinite(value[0]))
    {
    if (value[0] < 1)
        {
    while (value[0] < 1)
    {
            value[1] -= 1;
            value[0] *= 1000;
    }
        }
    else
        {
    while (value[0] > 1000)
    {
            value[1] += 1;
            value[0] /= 1000;
    }
        }
    }

    return value;
}
