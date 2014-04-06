var noteFunction = {
		index : 1,
		nextAction : function ( index ){
			var flag = false;
			if( index == 1){
				flag = noteFunction.verify_note_base();
			}else if( index == 2 ){
				flag = noteFunction.verify_note_appearanceOrNose();
			}else if( index == 3 ){
				flag = noteFunction.verify_note_palate();
			}
			if( flag ){
				$('#add_the_tasting_notes_'+index ).animate( { 'height' : 'toggle', opacity: 'hide'}, 'slow' );
				$('#add_the_tasting_notes_'+(index+1)).animate( { 'height' : 'toggle', opacity: 'show'}, 'slow' );
				$("#add_the_tasting_notes_action_button").attr( "onclick", "noteFunction.nextAction( "+(index+1)+" );" );
				$("#add_the_tasting_notes_nav_"+(index+1) ).addClass( "color" );
				$("#add_the_tasting_notes_nav_"+(index+1) ).attr( "onclick", "noteFunction.editForm( "+(index+1)+" );" );
				if( index == 2 ){
					$("#add_the_tasting_notes_action_button").attr( "onclick", "noteFunction.submitNoteForm();" );
					$("#add_the_tasting_notes_action_button").attr( "value", "保存" );
				}
				noteFunction.index = noteFunction.index+1;
			}
 		},
		submitNoteForm : function (){
			var flag_nb = noteFunction.verify_note_base();
			if( !flag_nb ){
				if( noteFunction.index != 1 ){
					noteFunction.editForm( 1 );
				}
				return ;
			}
			var flag_nan = noteFunction.verify_note_appearanceOrNose();
			if( !flag_nan ){
				if( noteFunction.index != 2 ){
					noteFunction.editForm( 2 );
				}
				return ;
			}
			var flag_np = noteFunction.verify_note_palate();
			if( !flag_np ){
				if( noteFunction.index != 3 ){
					noteFunction.editForm( 3 );
				}
				return ;
			}
			$("#add_test_wine_note_form").submit();
		},
		editForm : function ( index ){
			$('#add_the_tasting_notes_'+(noteFunction.index) ).animate( { 'height' : 'toggle', opacity: 'hide'}, 'slow' );
			$('#add_the_tasting_notes_'+index ).animate( { 'height' : 'toggle', opacity: 'show'}, 'slow' );
			noteFunction.index = index;
		},
		tipSelectPage : function ( title , url ){
			TIP_FUNCTION.TIP_OPEN_HTML_SHOW( title , url , 500 , 380, true );
		},
		backfillArea : function ( id, name ){
			noteFunction.removeBorderColour( 'producing_area_name' );
			$("#producing_area_name").val( name );
			$("#producing_area_id").val( id );
		},
		backfillManufacturer : function ( id, name ){
			noteFunction.removeBorderColour( 'manufacturer_name' );
			$("#manufacturer_name").val( name );
			$("#manufacturer_id").val( id );
		},
		backfillGrape : function ( id, name ){
			noteFunction.removeBorderColour( 'grape_name' );
			$("#grape_name").val( name );
			$("#grape_id").val( id );
		},
		backfillColour :　function ( id, name ){
			noteFunction.removeBorderColour( 'colour_name' );
			$("#colour_name").val( name );
			$("#colour_id").val( id );
		},
		backfillRelish : function ( id, name ){
			noteFunction.removeBorderColour( 'relish_name' );
			$("#relish_name").val( name );
			$("#relish_id").val( id );
		},
		verify_note_base : function (){
			var grapeCode = $("#grape_code").val();
			if( !grapeCode ){
				$("#grape_code").css("border-color", "red");
				return false;
			}
			var wineName = $("#wine_name").val();
			if( !wineName ){
				$("#wine_name").css("border-color", "red");
				return false;
			}
			var areaName = $("#producing_area_name").val();
			var areaId = $("#producing_area_id").val();
			if( !areaName||!areaId ){
				$("#producing_area_name").css("border-color", "red");
				return false;
			}
			var manufacturerName = $("#manufacturer_name").val();
			if( !manufacturerName ){
				$("#manufacturer_name").css("border-color", "red");
				return false;
			}
			var grapeName = $("#grape_name").val();
			var grapeId = $("#grape_id").val();
			if( !grapeName||!grapeId ){
				$("#grape_name").css("border-color", "red");
				return false;
			}
			var year = $("#year_id").val();
			if( !year ){
				$("#year_id").css("border-color", "red");
				return false;
			}
			var testDate = $("#test_date_id").val();
			if( !testDate ){
				$("#test_date_id").css("border-color", "red");
				return false;
			}
			var reg = /^(([1-9]\d*)|0)(\.\d{1,2})?$/;
			var priceCost = $("#price_cost_id").val();
			if( !priceCost ){
				$("#price_cost_id").css("border-color", "red");
				return false;
			}else{
				if(!reg.test(priceCost)){
					$("#price_cost_id").css("border-color", "red");
					return false;
				}
			}
			var priceMarket = $("#price_market_id").val();
			if( !priceMarket ){
				$("#price_market_id").css("border-color", "red");
				return false;
			}else{
				if(!reg.test(priceMarket)){
					$("#price_market_id").css("border-color", "red");
					return false;
				}
			}
			return true;
		},
		verify_note_appearanceOrNose : function (){
			var clarity = $('input[name="clarity_id"]:checked').val();
			if( !clarity ){
				$("#clarity_message_id").show();
				return false;
			}
			var colourIntensity = $('input[name="colorIntensity_id"]:checked').val();
			if( !colourIntensity ){
				$("#colorIntensity_message_id").show();
				return false;
			}
			var colourName = $("#colour_name").val();
			var colourId = $("#colour_id").val();
			if( !colourName||!colourId ){
				$("#colour_name").css("border-color", "red");
				return false;
			}
			var condition = $('input[name="condition_id"]:checked').val();
			if( !condition ){
				$("#condition_message_id").show();
				return false;
			}
			var intensity = $('input[name="intensity_id"]:checked').val();
			if( !intensity ){
				$("#intensity_message_id").show();
				return false;
			}
			return true;
		},
		verify_note_palate : function (){
			var sweetness = $('input[name="sweetness_id"]:checked').val();
			if( !sweetness ){
				$("#sweetness_message_id").show();
				return false;
			}
			var acidity = $('input[name="acidity_id"]:checked').val();
			if( !acidity ){
				$("#acidity_message_id").show();
				return false;
			}
			var tannin = $('input[name="tannin_id"]:checked').val();
			if( !tannin ){
				$("#tannin_message_id").show();
				return false;
			}
			var body = $('input[name="body_id"]:checked').val();
			if( !body ){
				$("#body_message_id").show();
				return false;
			}
			var relishName = $("#relish_name").val();
			var relishId = $("#relish_id").val();
			if( !relishName||!relishId ){
				$("#relish_name").css("border-color", "red");
				return false;
			}
			var aftertast = $('input[name="aftertast_id"]:checked').val();
			if( !aftertast ){
				$("#aftertast_message_id").show();
				return false;
			}
			var quality = $('input[name="quality_id"]:checked').val();
			if( !quality ){
				$("#quality_message_id").show();
				return false;
			}
			return true;
		},
		removeBorderColour : function ( id ){
			$("#"+id).css("border-color", "");
		},
		removeRadioTipMessage : function ( id ){
			$("#"+id+"_message_id").hide();
		}
}
