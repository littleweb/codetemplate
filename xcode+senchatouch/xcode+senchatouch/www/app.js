Ext.application({
    name: 'demo',
    //视图
    views: [],
    //控制器
    controllers: [],
    //models
    models: [],
    //数据
    stores: [],
    launch: function() {
        //隐藏网页loading
        document.getElementById('loading').style.display = 'none';
        Ext.Msg.alert('启动成功！');
    }
});