<?php
namespace Admin\Controller;
use Think\Controller;
/**
 * 通用基类控制器
 */
class PublicController extends Controller{
	/**
	 * 初始化方法
	 */
	public function login(){
		if (IS_POST) {
			$wh['user'] = I('name');
			$wh['pass'] = md5(I('password'));
			$info = M('admin')->where($wh)->find();
			if ($info) {
				session('user.id',$info['id']);
				session('user.username',$info['username']);
				$this->ajaxReturn(array('success'=>true,'info'=>'登录成功！'));
			}else{
				$this->ajaxReturn(array('success'=>false,'info'=>'登录失败！'));
			}
		}else {
			$this->display();
		}
	}

	function logout(){
		session('user',null);
		$this->redirect("Public/login");
	}

	function error(){
		$this->display();
	}

}

