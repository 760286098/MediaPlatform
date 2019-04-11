var $table = $('#article_table');
$(function(){
    $table.bootstrapTable({
        url:baselocation+'/dataAnalyze/dataTotal/',
        height:'1000',
        striped:true,
        pageNumber:1,
        showRefresh:true,
        showColumns: true,
        minimumCountColumns: 1,
        clickToSelect: true,
        detailView: true,
        pagination: true,
        paginationLoop: false,
        sidePagination: 'server',
        pageSize: '20',
        silentSort: false,
        smartDisplay: false,
        escape: true,
        searchOnEnterKey: true,
        idField: 'articleId',
        maintainSelected: true,
        sortName: 'articleId',
        sortOrder: 'desc',
        editable: true,
        columns:[
            {field:'articleId',title:'文章序列号',sortable:true,align:'center', halign: 'center'},
            {field:'title',title:'文章标题',sortable:true,align:'center', halign: 'center'},
            {field:'content',title:'文章描述',sortable:true,align:'center', halign: 'center'}
        ]
    });
});