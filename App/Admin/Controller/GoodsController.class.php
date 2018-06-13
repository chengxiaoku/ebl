<?php
/**
 * Created by PhpStorm.
 * User: 程龙飞
 * Date: 2017/8/29
 * Time: 18:17
 */
namespace Admin\Controller;
class GoodsController extends BaseController{
    private $tbl_obj = '';
    function _initialize(){
        $this->tbl_obj = M('goods');
    }
    function index(){
        extract(I('get.'));
        $count = $this->tbl_obj->where(array('style_id'=>$style_id))->count();
        $Page = new \Think\Page($count,C('PAGE_NUM'));
        $list = $this->tbl_obj->order("id desc")->where(array('style_id'=>$style_id))->limit($Page->firstRow.','.$Page->listRows)->select();
        $this->assign('list',$list);
        $this->assign('page',$Page->show());
        $this->assign('style_id',$style_id);
        $this->display();
    }

    function add(){

        if(IS_GET){
            extract(I('get.'));
           
            $this->assign('style_id',$style_id);
            $this->display();
        }else{
            extract(I('post.'));
            $data['name'] = $name;
            $data['style_id'] = $style_id;
            $bool = $this->tbl_obj->add($data);
            if($bool){
                $this->ajaxSuccess(array(),'添加商品信息成功!');
            }else{
                $this->ajaxError('添加商品信息失败!');
            }
        }
    }
    function update(){
        if(IS_GET){
            extract(I('get.'));
            $data = $this->tbl_obj->find($id);
            $this->assign('data',$data);
            $this->display();
        }else{
            $bool = $this->tbl_obj->save($this->tbl_obj->create());
            if($bool){
                $this->ajaxSuccess(array(),'修改商品信息成功!');
            }else{
                $this->ajaxError('修改商品信息失败!');
            }
        }
    }
    function del(){
        extract(I('get.'));
        $bool = $this->tbl_obj->delete($id);
        if($bool){
            $this->ajaxSuccess(array(),'商品信息删除成功!');
        }else{
            $this->ajaxError('商品信息删除失败!');
        }
    }
}
