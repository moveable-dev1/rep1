jQuery(document).ready(function ($) {

	//base path used in hover/on/off states
	var formattedDefaultIMG = "$(this).children().attr('src').substring(0, $(this).children().attr('src').indexOf('_') + '_'.length)";
	// content arrays
	// primary click array
	var primaryGrid = new Array();
	primaryGrid = [46, 'op', 47, 'op', 48, 'op', 126, 'generation', 127, 'generation', 128, 'generation', 144, 'microgrid', 145, 'microgrid', 146, 'microgrid', 205, 'transmission', 206, 'transmission', 207, 'transmission', 284, 'distribution', 285, 'distribution', 286, 'distribution', 337, 'tech', 338, 'tech', 339, 'tech']

	// secondary click array
	var secondaryGrid = new Array();
	secondaryGrid = [58, 'nuclear', 59, 'nuclear', 83, 'nuclear', 84, 'nuclear', 110, 'tower', 111, 'tower', 135, 'tower', 136, 'tower', 104, 'hydro', 105, 'hydro', 129, 'hydro', 130, 'hydro', 81, 'gas', 82, 'gas', 106, 'gas', 107, 'gas', 291, 'residential', 292, 'residential', 316, 'residential', 317, 'residential', 237, 'ads', 238, 'ads', 600, 'ads', 600, 'ads', 220, 'comInd', 221, 'comInd', 245, 'comInd', 246, 'comInd', 247, 'comInd', 248, 'comInd', 272, 'comInd', 273, 'comInd', 60, 'solar', 36, 'wind', 62, 'biomass', 61, 'other', 143, 'generation2', 167, 'cTech', 169, 'eStorage', 262, 'ami', 600, 'ami', 600, 'ami', 600, 'ami', 600, 'ami', 600, 'ami', 239, 'dGeneration', 242, 'es']


	// secondary HL array
	var secondaryGridOver = new Array();
	secondaryGridOver = [79, 'hydroHL', 80, 'hydroHL', 56, 'gasHL', 57, 'gasHL', 32, 'nuclearHL', 33, 'nuclearHL', 34, 'solarHL', 35, 'solarHL', 63, 'biomassHL', 64, 'biomassHL', 86, 'otherHL', 87, 'otherHL', 118, 'generation2HL', 119, 'generation2HL', 141, 'cTechHL', 142, 'cTechHL', 170, 'eStorageHL', 171, 'eStorageHL', 240, 'dGenerationHL', 241, 'dGenerationHL', 197, 'comIndHL', 198, 'comIndHL', 266, 'residentialHL', 267, 'residentialHL', 37, 'windHL', 38, 'windHL', 243, 'esHL', 244, 'esHL', 187, 'adsHL', 188, 'adsHL', 212, 'adsHL', 213, 'adsHL', 263, 'amiHL', 264, 'amiHL', 265, 'amiHL', 288, 'amiHL', 289, 'amiHL', 290, 'amiHL', 89, 'towerHL', 110, 'towerHL', 111, 'towerHL', 113, 'towerHL', 114, 'towerHL', 135, 'towerHL', 136, 'towerHL', 137, 'towerHL', 138, 'towerHL', 158, 'towerHL', 159, 'towerHL', 160, 'towerHL', 162, 'towerHL', 162, 'towerHL', 183, 'towerHL', 184, 'towerHL']


	$('.pCheck').click(function () {
		l = $(this).attr('id')
		$('.' + l).eq(0).click()

	})

	function sniffEnabled(k) {

	}

	//Turn all checkboxes in category 2 on/off based on category 1
	function togglePrimary(r) {

		l = r
		x = eval(l)
		b = "$('#" + l + "')"

		if (eval(b).prop('checked')) {
			//alert(1)
			eval(b).prop('checked', 'false')
			for (i = 0; i < eval(l).length; i++) {
				if ($('#' + x[i]).prop("checked")) {
					$('.' + x[i]).eq(0).click()
				}
				$('.' + x[i]).eq(0).click()
			}

		} else {

			eval(b).prop('checked', 'true')
			for (i = 0; i < eval(l).length; i++) {
				if (!$('#' + x[i]).prop("checked")) {
					$('.' + x[i]).eq(0).click()
				}
				$('.' + x[i]).eq(0).click()
			}
		}
	}

	
	

	$('.sCheck').click(function () {
		l = '.' + $(this).attr('id')
		$(l).eq(0).click()
	})

	//create full grid elements  - MAGIC :-)
	var fullGrid = '';
	for (i = 0; i < 376; i++) {
		fullGrid += '<div class="grid25 element' + i + '" dataVal="' + i + '"><img src="/wp-content/themes/marsaec/img/grid/marsgrid_' + i + '.jpg" class="gridIMG" alt=" " /></div>';
	}
	// create grid html
	$('.visualSelect').append(fullGrid);



	//categories
	var generation = new Array()
	generation = ['solar', 'wind', 'biomass', 'other', 'hydro', 'gas', 'nuclear', ]
	var microgrid = new Array()
	microgrid = ['generation2', 'cTech', 'eStorage']
	var transmission = new Array()
	transmission = ['tower']
	var distribution = new Array()
	distribution = ['ads', 'ami', 'es', 'dGeneration']
	var tech = new Array()
	tech = ['comInd', 'residential']

	var op = new Array()
	op = []




	//set primary html elements
	$('.grid25').each(function (index) {
		for (i = 0; i < primaryGrid.length; i++) {
			if ($(this).attr('dataVal') == primaryGrid[i]) {
				$(this).addClass(primaryGrid[i + 1])
				$(this).addClass('clickable')
			}
		}
	})



	//set secondary html elements
	$('.grid25').each(function (index) {
		for (i = 0; i < secondaryGrid.length; i++) {
			if ($(this).attr('dataVal') == secondaryGrid[i]) {
				$(this).addClass(secondaryGrid[i + 1])
				$(this).addClass('clickable secondaryGrid')
				$(this).attr('hl', secondaryGrid[i + 1])
			}
		}
	})

	//set secondary HL html elements
	$('.grid25').each(function (index) {
		for (i = 0; i < secondaryGridOver.length; i++) {
			if ($(this).attr('dataVal') == secondaryGridOver[i]) {
				$(this).addClass(secondaryGridOver[i + 1])
				$(this).attr('hlClass', secondaryGridOver[i + 1])

			}
		}
	})


	//Primary tag functionality
	function setPrimary(i) {
		$('.' + primaryGrid[i]).click(function () {
			$('.' + primaryGrid[i]).each(function (index) {
				r = $(this).attr('dataval')


				if ($(this).hasClass('selected')) {
					$(this).removeClass('selected')
					r = $(this).attr('dataval')
					$('#' + primaryGrid[i]).prop("checked", false); // input code - to be removed/integrate with IDS
					$(this).children().attr('src', eval(formattedDefaultIMG) + r + '.jpg')
				} else {
					$(this).addClass('selected')
					$(this).children().attr('src', eval(formattedDefaultIMG) + 'primaryHL_' + r + '.jpg')
					$('#' + primaryGrid[i]).prop("checked", true); // input code - to be removed/integrate with IDS	
					//$('#'+primaryGrid[i]).click()
				}
				if (index == 0) {
					togglePrimary(primaryGrid[i])
				}
			})
		})
	}

	for (i = 1; i < primaryGrid.length; i += 6) {
		setPrimary(i)
	}

	//Secondary click functionality
	function getSRC(i, s) {
		$(s).each(function (index) {

			r = $(this).attr('dataval')

			if (i == 0) {
				$(this).addClass('secondaryClick')
				$(this).children().attr('src', eval(formattedDefaultIMG) + 'secondaryClick_' + r + '.jpg')
				$(this).css('cursor', 'pointer')
			} else {
				$(this).removeClass('secondaryClick')
				$(this).children().attr('src', eval(formattedDefaultIMG) + r + '.jpg')


			}
		})
	}

	//Secondary rollover functionality
	function getRollSRC(i, s) {
		$(s).each(function (index) {

			r = $(this).attr('dataval')

			if (!$(this).hasClass('secondaryClick')) {
				if (i == 0) {
					$(this).children().attr('src', eval(formattedDefaultIMG) + 'secondaryHL_' + r + '.jpg')
				} else {
					$(this).children().attr('src', eval(formattedDefaultIMG) + r + '.jpg')
				}
			}
		})
	}


	//Secondary tag/actions code
	function setSecondary(i) {

		$('.' + secondaryGrid[i]).click(function () {

			$('.' + secondaryGrid[i]).each(function () {
				r = $(this).attr('dataval')


				if ($(this).hasClass('selected')) {
					$('#' + secondaryGrid[i]).prop("checked", false); // input code - to be removed/integrate with IDS
					$(this).removeClass('selected')
					r = $(this).attr('dataval')
					s = "." + $(this).attr('hl') + "HL"
					getSRC(1, s)
				} else {
					$('#' + secondaryGrid[i]).prop("checked", true); // input code - to be removed/integrate with IDS
					$(this).addClass('selected')
					s = "." + $(this).attr('hl') + "HL"
					getSRC(0, s)
				}
			})

		})

		if (secondaryGrid[i] != 'tower') {
			$('.' + secondaryGrid[i]).mouseover(function () {
				$('.' + secondaryGrid[i]).each(function () {
					r = $(this).attr('dataval')
					s = "." + $(this).attr('hl') + "HL"
					getRollSRC(0, s)
				})
			})

			$('.' + secondaryGrid[i]).mouseout(function () {
				$('.' + secondaryGrid[i]).each(function () {
					r = $(this).attr('dataval')
					s = "." + $(this).attr('hl') + "HL"
					getRollSRC(1, s)
				})
			})
		}

	}

	// bind secondary functionality 

	for (i = 1; i < secondaryGrid.length; i) {
		setSecondary(i)
		if (secondaryGrid[i] == "tower" || secondaryGrid[i] == "hydro" || secondaryGrid[i] == 'nuclear' || secondaryGrid[i] == 'gas' || secondaryGrid[i] == 'residential' || secondaryGrid[i] == 'ads') {
			i += 8
		} else if (secondaryGrid[i] == "comInd") {
			i += 16
		} else if (secondaryGrid[i] == 'ami') {
			i += 12
		} else {
			i += 2

		}
	}
})


jQuery(window).load(function ($) {
	
	var j = jQuery.noConflict();
	
	//Turn on all checkboces
	j('#op').click()
	j('#generation').click()
	j('#microgrid').click()
	j('#transmission').click()
	j('#distribution').click()
	j('#tech').click()


	
	//wait until all images are loaded and fade loader out

	j('.loader').fadeOut(500)
	j('.visualSelect').fadeIn(1500)

	
	
	//Add classes after grid built
	j('.grid25').each(function (index) {
		if (j(this).attr('hlclass') != null && !j(this).hasClass('towerHL')) {
			j('.element' + index).click(function () {

				j('#' + j(this).attr('hlclass').replace('HL', '')).click()

			})
		}
	})
	

	// DEV testing show/hide
	j('.tog').click(function () {
		j('.visualSelect').hide()
	})

	j('.tog2').click(function () {
		j('.visualSelect').show()
	})


});