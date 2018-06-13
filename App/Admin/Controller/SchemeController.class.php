<?php
namespace Admin\Controller;
class SchemeController extends BaseController{
    private $table_obj = '';

    function _initialize(){
        //parent::_initialize();
        $this->table_obj = M('type');
    }
    function index(){
        $data = M('type')->select();
        $num = array();
        foreach ($data as $key => $val){
            $num[$key] = M('style')->where(array('type_id' => $val['id']))->count();
        }
        
        $this->assign('num',$num);
        $this->assign('list',$data);
        $this->display();

    }
    function add(){
        if(IS_GET){
           $this->display();
        }else{
            $bool = $this->table_obj->add($this->table_obj->create());
            if($bool){
                $this->ajaxSuccess(array(),'添加方案信息成功!');
            }else{
                $this->ajaxError('添加方案信息失败!');
            }
        }
    }
    function update(){
        if(IS_GET){
            extract(I('get.'));
            $data = $this->table_obj->find($id);
            $this->assign('data',$data);
           $this->display();
        }else{
            $bool = $this->table_obj->save($this->table_obj->create());
            if($bool){
                $this->ajaxSuccess(array(),'修改方案信息成功!');
            }else{
                $this->ajaxError('修改方案信息失败!');
            }
        }
    }
    function del(){
        extract(I('get.'));
        $bool = $this->table_obj->delete($id);
        if($bool){
            $this->ajaxSuccess(array(),'方案信息删除成功!');
        }else{
            $this->ajaxError('方案信息删除失败!');
        }
    }
}