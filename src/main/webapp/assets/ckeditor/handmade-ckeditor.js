$(document).ready(function() {
    $(function() {
		$("#news_content").ckeditor({
			toolbar : 'Basic',
			editorplaceholder: 'Nội dung của bài viết .....',
			uiColor : '#F7D358',
			height  : 465
		});
		
		$("#news_title").ckeditor({
			toolbar: [
				{ name: 'document', items: [ 'Source', '-' ] },											
				{ name: 'undo', items: [ 'Undo', 'Redo' ] },																
				{ name: 'align', items: [ 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-' ] },																									
				{ name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', '-', 'Subscript', 'Superscript', '-' ] },
				{ name: 'colors', items: [ 'TextColor', 'BGColor', '-' ] },
				{ name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] }
			],
			editorplaceholder: 'Tiêu đề của bài viết .....',
			uiColor : '#F7D358',
			height  : 77
		});
		
		$("#news_summary").ckeditor({
			toolbar: [
				{ name: 'document', items: [ 'Source', '-' ] },											
				{ name: 'undo', items: [ 'Undo', 'Redo' ] },																
				{ name: 'align', items: [ 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-' ] },																									
				{ name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', '-', 'Subscript', 'Superscript', '-' ] },
				{ name: 'colors', items: [ 'TextColor', 'BGColor' ] },
				{ name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] }
			],
			editorplaceholder: 'Tóm lược của bài viết .....',
			uiColor : '#F7D358',
			height  : 100
		});
	}); 
});