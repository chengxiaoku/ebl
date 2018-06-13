<?php
namespace Admin\Controller;


class UserController extends BaseController{
    /**
     * 监理小哥信息显示页面
     */
    public function index()
    {
        //$user_num = M('member')->count();
        //拉取用户信息
        $member_obj = M('member');
        $count = $member_obj->count();
        $Page = new \Think\Page($count,C('PAGE_NUM'));
        $list = $member_obj->order("id desc")->limit($Page->firstRow.','.$Page->listRows)->select();

        $this->assign('list',$list);
        $this->assign('page',$Page->show());

        $this->display();
    }

    /**
     * 添加客户信息
     */
    function add(){
        if(IS_GET){
            $this->display();
        }else{
            $member_obj = M('member');
            $data = $member_obj->create();
            $bool = $member_obj->add($data);
            if($bool){
                $this->ajaxSuccess(array(),U('Select/index',array('user_id'=>$bool)));
            }else{
                $this->ajaxError('添加客户信息失败!');
            }
        }
    }

    /**
     * 删除客户信息
     */
    function del(){
        $member_obj = M('member');
        extract(I('get.'));
        $bool = $member_obj->delete($id);
        if($bool){
            $this->ajaxSuccess(array(),'客户信息删除成功!');
        }else{
            $this->ajaxError('客户信息删除失败!');
        }
    }

    /**
     * 修改客户信息
     */
    function update(){

        $member_obj = M('member');
        if(IS_GET){
            extract(I('get.'));
            $data = $member_obj->find($id);
            $this->assign('data',$data);
            $this->display();  
        }else{
            $bool = $member_obj->save($member_obj->create());
            if($bool){
                $this->ajaxSuccess(array(),'客户信息修改成功!');
            }else{
                $this->ajaxError('客户信息修改失败!');
            }
        }
    }

    function search(){
        $val = I('get.val','','trim');
        //拉取用户信息
        $butler_obj = M('member');
        if(empty($val)){
            $where = '';
        }else{
            $where = "username Like '%".$val."%' OR tel Like '%".$val."%'";
        }
        $count = $butler_obj->where($where)->count();
        $Page = new \Think\Page($count,C('PAGE_NUM'));
        $list = $butler_obj->order("id desc")->limit($Page->firstRow.','.$Page->listRows)->where($where)->select();
        $this->assign('list',$list);
        $this->assign('page',$Page->show());
        $this->assign('se_val',$val);
        $this->display('index');
    }

    /**
     * 获取用户信息
     */
    function get_goods_info(){
        extract(I('get.'));
        $user_data = M('member')->find($id);
        $data = M('order a')
            ->join('ebl_goods as b ON a.goods_id = b.id')
            ->field('b.name,a.*')
            ->where(array('a.member_id'=>$id))
            ->select();
        $str = '';
        if(!$data){
            echo "<h4>暂无数据。</h4>";
        }else{
            $str .= "<table class=\"am-table am-table-bordered\">
                <thead>
                    <tr><td colspan='6'>
                        <img id='img' src=''><span style='margin-left: 20px'>EBERY伊百丽全屋定制郏县店</span>
                    </td></tr>
                    <tr><td colspan='6'><span style='margin-left: 30px'>".$user_data['adress']."</span></td></tr>
                    <tr>
                        <th>名称</th>
                        <th>材质</th>
                        <th>颜色</th>
                        <th>数量</th>
                        <th>报价</th>
                        <th>尺寸</th>
                    </tr>
                </thead>
                <tbody>";
            foreach ($data as $key => $val){
                $str .= "<tr>
                        <td>".$val['name']."</td>
                        <td>".$val['goods_cz']."</td>
                        <td>".$val['goods_color']."</td>
                        <td>".$val['goods_num']."</td>
                        <td>".$val['goods_price']."</td>
                        <td>".$val['goods_cc']."</td>
                    </tr>
                            ";
            }
            $str.="   </tbody>
</table>";
        }
        $this->assign('str',$str);
        $this->display('dayin');
    }






}
