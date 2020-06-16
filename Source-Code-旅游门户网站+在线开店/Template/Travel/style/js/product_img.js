var zoomController, zoomControllerUl, zoomControllerUlLeft = 0,
    shell = $('#product_img'),
    shellPanel = shell.parent().hide(),
    heightOffset = 80,
    minGallerySize = [468, shellPanel.height() - heightOffset],
    imageZoom = new ImageZoom({
        shell: shell,
    basePath: '',
    levelASize: [64, 64],
    levelBSize: [360, 360],
    gallerySize: minGallerySize,
    onBeforeZoom: function(index, level){
        if(!zoomController){
            zoomController = shell.find('div.controller');
        }

        var 
        self = this,
    duration = 320,
    width = minGallerySize[0], 
    height = minGallerySize[1],
    zoomFx = function(){
        self.ops.gallerySize = [width, height];
        self.galleryPanel.stop().animate({width:width, height:height}, duration);
        shellPanel.stop().animate({height:height + heightOffset}, duration);
        zoomController.animate({width:width-22}, duration);
        shell.stop().animate({width:width}, duration);
    };
    if(level !== this.level && this.level !== 0){
        if(this.level === 1 && level > 1){
            height = Math.max(520, shellPanel.height());
            width = shellPanel.width();
            zoomFx();
        }
        else if(level === 1){
            zoomFx();
        }
    }
    },
    onZoom: function(index, level, prevIndex){
                if(index !== prevIndex){
                    if(!zoomControllerUl){
                        zoomControllerUl = zoomController.find('ul').eq(0);
                    }
                    var 
                        width = 76, 
                              ops = this.ops,
                              count = ops.items.length,
                              panelVol = ~~((zoomController.width() + 10)/width),
                              minLeft = width * (panelVol - count),
                              left = Math.min(0, Math.max(minLeft, -width * ~~(index-panelVol/2)));

                    if(zoomControllerUlLeft !== left){
                        zoomControllerUl.stop().animate({left: left}, 320);
                        zoomControllerUlLeft = left;
                    }
                }
                shell.find('a.prev,a.next')[level<3 ? 'removeClass' : 'addClass']('hide');
                shell.find('a.close').css('display', [level>1 ? 'block' : 'none']);
            },
    items: [
    {title : '日本MAXELL/麦克赛尔 SMS10 可折叠时尚头戴耳机 集成线控麦克-白色',levelA : 'images/64x64/b01_2.jpg',levelB : 'images/360x360/b01_2.jpg',levelC : 'images/450x450/b01_2.jpg',levelD : 'images/1200x1200/b01_2.jpg'},
    {title : '日本MAXELL/麦克赛尔 SMS10 可折叠时尚头戴耳机 集成线控麦克-白色',levelA : 'images/64x64/b02_2.jpg',levelB : 'images/360x360/b02_2.jpg',levelC : 'images/450x450/b02_2.jpg',levelD : 'images/1200x1200/b02_2.jpg'},
    {title : '日本MAXELL/麦克赛尔 SMS10 可折叠时尚头戴耳机 集成线控麦克-白色',levelA : 'images/64x64/b03_2.jpg',levelB : 'images/360x360/b03_2.jpg',levelC : 'images/450x450/b03_2.jpg',levelD : 'images/1200x1200/b03_2.jpg'},
    {title : '日本MAXELL/麦克赛尔 SMS10 可折叠时尚头戴耳机 集成线控麦克-白色',levelA : 'images/64x64/b04_3.jpg',levelB : 'images/360x360/b04_3.jpg',levelC : 'images/450x450/b04_3.jpg',levelD : 'images/1200x1200/b04_3.jpg'}
    ]
    });
shell.data('imageZoom', imageZoom);
shellPanel.show();
