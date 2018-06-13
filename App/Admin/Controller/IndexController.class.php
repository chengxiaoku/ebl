<?php
namespace Admin\Controller;



	/**
	 * 后台首页控制器
	 */
class IndexController extends BaseController{
	/**
	 * 监理小哥信息显示页面
	 */
	public function index()
	{
		//$user_num = M('member')->count();
		$style_num = M('style')->count();
		$member_num = M('member')->count();
		$goods_num = M('goods')->count();

		$this->assign('style_num',$style_num);
		$this->assign('member_num',$member_num);
		$this->assign('goods_num',$goods_num);
		$this->display();
	}

	/**
	 * 修改数据
	 */
	function update(){

	}

	/**
	 * 删除数据
	 */
	function get_member_num(){
		$data = M('member')
			->field('count(id) as num,create_time')
			->group('time')
			->order('id DESC')
			->limit($num = 5)->select();
		$newarr = array();
		foreach ($data as $key => $val){
			$newarr['create_time'][$key] = $val['create_time'];
			$newarr['num'][$key] = $val['num'];
		}
		//数据反转
		$new_data['time'] = array_reverse($newarr['time']);
		$new_data['amount'] = array_reverse($newarr['amount']);
		$this->ajaxReturn($new_data);
	}





}
