<?php

use Medoo\Medoo;

class adminController extends \Yaf\Controller_Abstract {

	public function init() {
		$this->getConnection();
		$this->table = $this->getRequest()->getparam('table');


		$this->_view->html = new HtmlModel();
		$this->_view->html->enableEditable();

		$this->_view->url=['prefix'=>'/admin/','table'=> $this->table ];

		$blocks =  array_reduce(
			$this->dbConnect->select("blocks", ['id','title'],["ORDER"=>"orderby"]),
			function($temp,$v){
				$temp[$v['id']] = $v['title'];
				return $temp;
			});

		$sections =  array_reduce(
			$this->dbConnect->select("sections", ['view','name'],["status"=>"1"]),
			function($temp,$v){
				$temp[$v['view']] = $v['name'];
				return $temp;
			});

		$this->tables = [
			'links'=>[
				'format'=>'tree',	//支持树形数组
				'where' =>['type'], //url参数1过滤

				'list'=>[			//列表页
					'label'=>'链接',
					'table'=>'links',
					'format'=>[
			            ['label'=>'名称','type'=>'text','editable'=>true,'field'=>'name','class'=>'ellipsis'],
			            ['label'=>'链接','type'=>'text','editable'=>true,'field'=>'link','class'=>'ellipsis'],
			            ['label'=>'状态','type'=>'toggle','editable'=>true,'field'=>'status'],
			            ['label'=>'操作','type'=>'buttons','class'=>'ellipsis','buttons'=>[
			            	['label'=>'编辑','icon'=>'bx bx-edit-alt',"class"=>"redirect",'function'=>'updatefields'],
			            	['label'=>'删除','icon'=>'bx bx-x',"class"=>"remove",'function'=>'remove']
			            ]],
			        ],
			        'sortable'=>['enable'=>true,'function'=>'updatesort'],
			        'add' =>['label'=>'添加','icon'=>'bx bx-plus',"class"=>"redirect",'function'=>'updatefields'],
		    	],
		    	'fields'=>[			//编辑页
		            ['name'=>'type','label'=>'类型','type'=>'select','id'=>'view','options'=>['menu'=>'菜单','link'=>'链接','service'=>'服务'] ],
		            ['name'=>'name','label'=>'名称','type'=>'text','required'=>true ],
		            ['name'=>'link','label'=>'链接','type'=>'text','required'=>true ],
		            ['name'=>'others','label'=>'其他','type'=>'group','fields'=>[
		            
			            ['col'=>'4','name'=>'class','label'=>'class式样','type'=>'text','required'=>false ],
			            ['col'=>'4','name'=>'target','label'=>'target目标','type'=>'text','required'=>false ],
			            ['col'=>'4','name'=>'title','label'=>'title','type'=>'text','required'=>false ],
			            
					]],
					['name'=>'status','label'=>'状态','type'=>'radio','options'=>['1'=>'有效','0'=>'无效'] ],
				]
			],
			'blocks'=>[
				'format'=>'list',
				'where' =>[], 
				'list'=>[			//列表页
					'label'=>'模块',
					'table'=>'blocks',
					'format'=>[
			            ['label'=>'编码','type'=>'text','editable'=>true,'field'=>'code','class'=>'ellipsis'],
			            ['label'=>'标题','type'=>'text','editable'=>true,'field'=>'title','class'=>'ellipsis'],
			            ['label'=>'类型','type'=>'select','editable'=>false,'field'=>'view','class'=>'ellipsis'],
			            ['label'=>'状态','type'=>'toggle','editable'=>true,'field'=>'status'],
			            ['label'=>'操作','type'=>'buttons','class'=>'ellipsis','buttons'=>[
			            	['label'=>'编辑','icon'=>'bx bx-edit-alt',"class"=>"redirect",'function'=>'updatefields'],
			            	['label'=>'删除','icon'=>'bx bx-x',"class"=>"remove",'function'=>'remove']
			            ]],
			        ],
			        'sortable'=>['enable'=>true,'function'=>'updatesort'],
			        'add' =>['label'=>'添加','icon'=>'bx bx-plus',"class"=>"redirect",'function'=>'updatefields'],
		    	],
				'fields'=>[
		            ['name'=>'code','label'=>'编码','type'=>'text','id'=>'code','required'=>true,'minlength'=>'4'],
		            ['name'=>'view','label'=>'模块','type'=>'select','id'=>'view','options'=>$sections ],
		            ['name'=>'title','label'=>'标题','type'=>'text','required'=>false ],
		            ['name'=>'description','label'=>'描述','type'=>'textarea','required'=>false ],
		            ['name'=>'img','label'=>'图片','type'=>'group','fields'=>[
			            ['col'=>'12','name'=>'img','label'=>'url链接','type'=>'text','required'=>false ],
			            ['col'=>'12','name'=>'img_alt','label'=>'alt描述','type'=>'text','required'=>false ],
			        ]],
					['name'=>'img','label'=>'链接','type'=>'group','fields'=>[
			            ['col'=>'12','name'=>'link_name','label'=>'文字','type'=>'text','id'=>'code','required'=>true,'minlength'=>'4'],
			            ['col'=>'12','name'=>'link_url','label'=>'url链接','type'=>'text','id'=>'view'],

			            
			            ['col'=>'4','name'=>'link_class','label'=>'class式样','type'=>'text','required'=>false ],
			            ['col'=>'4','name'=>'link_target','label'=>'target目标','type'=>'text','required'=>false ],
			            ['col'=>'4','name'=>'link_icon','label'=>'icon图标','type'=>'text','required'=>false ],
			            
					]],
					['name'=>'status','label'=>'状态','type'=>'radio','options'=>['1'=>'有效','0'=>'无效'] ],
				]
			],
			'nodes'=>[
				'format'=>'list',
				'where' =>['block_id'], 
				'list'=>[			//列表页
					'label'=>'节点',
					'table'=>'nodes',
					'format'=>[
			            ['label'=>'编码','type'=>'text','editable'=>true,'field'=>'code','class'=>'ellipsis'],
			            ['label'=>'标题','type'=>'text','editable'=>true,'field'=>'title','class'=>'ellipsis'],
			            ['label'=>'状态','type'=>'toggle','editable'=>true,'field'=>'status'],
			            ['label'=>'操作','type'=>'buttons','class'=>'ellipsis','buttons'=>[
			            	['label'=>'编辑','icon'=>'bx bx-edit-alt',"class"=>"redirect",'function'=>'updatefields'],
			            	['label'=>'删除','icon'=>'bx bx-x',"class"=>"remove",'function'=>'remove']
			            ]],
			        ],
			        'sortable'=>['enable'=>true,'function'=>'updatesort'],
			        'add' =>['label'=>'添加','icon'=>'bx bx-plus',"class"=>"redirect",'function'=>'updatefields'],
		    	],
				'fields'=>[
		            ['name'=>'code','label'=>'编码','type'=>'text','id'=>'code','required'=>true,'minlength'=>'4'],
		            ['name'=>'block_id','label'=>'模块','type'=>'select','id'=>'view','options'=>$blocks ],
		            ['name'=>'title','label'=>'标题','type'=>'text','required'=>false ],
		            ['name'=>'description','label'=>'描述','type'=>'textarea','required'=>false ],
		            ['name'=>'img','label'=>'图片','type'=>'text','required'=>false ],
					['name'=>'link','label'=>'链接','type'=>'group','fields'=>[
			            ['col'=>'12','name'=>'link_name','label'=>'文字','type'=>'text','id'=>'code','required'=>true,'minlength'=>'4'],
			            ['col'=>'12','name'=>'link','label'=>'url链接','type'=>'text','id'=>'view','options'=>['hero1'] ],

			            
			            ['col'=>'4','name'=>'link_class','label'=>'class式样','type'=>'text','required'=>false ],
			            ['col'=>'4','name'=>'link_target','label'=>'target目标','type'=>'text','required'=>false ],
			            ['col'=>'4','name'=>'link_icon','label'=>'icon图标','type'=>'text','required'=>false ],
			            
					]],
					['name'=>'delay','label'=>'延迟','type'=>'text','required'=>false ],
					['name'=>'status','label'=>'状态','type'=>'radio','options'=>['1'=>'有效','0'=>'无效'] ],

					['name'=>'created','label'=>'时间','type'=>'text'],
				]
			]
		];
	}

    public function getConnection() {
		$DbConf = \Yaf\Registry::get('config')->application->db;
		$this->dbConf = [
		    'database_type' => $DbConf->type,
		    'database_name' => $DbConf->database,
		    'server' => $DbConf->server,
		    'username' => $DbConf->username,
		    'password' => $DbConf->password,
		    'charset' => $DbConf->charset,
		    'port' => $DbConf->port,
		    'option' => [
		        \PDO::ATTR_CASE => \PDO::CASE_NATURAL,
		        \PDO::ATTR_PERSISTENT => true
		    ]
		];
		
		if (!isset($this->dbConnect)) {
		    $this->dbConnect = new Medoo($this->dbConf);
		}
	}

	public function listAction() {

		$orderby = ["ORDER"=>"orderby"];
		if($this->getRequest()->getparam('where') !=''){
			$conditions = [];
			$where = explode('-',$this->getRequest()->getparam('where'));
			foreach ($this->tables[$this->table]['where'] as $k => $v) {
				// code...
				if(isset($where[$k])){
					$conditions[$v] =  $where[$k];
				}
			}
			//var_dump(json_decode(urldecode($this->getRequest()->getparam('where'))));
			$conditions = array_merge($conditions,$orderby);
			//var_dump($conditions);
		}else{
			$conditions =$orderby;
		}


		if ($this->tables[$this->table]['format'] == 'tree') {
			//var_dump($conditions);
			$data =  $this->dbConnect->select($this->table, "*",$conditions);

			if($data){
				$data =  array_tree($data,'parent_id');
				array_orderby($data,'orderby','asc','children');
			}

		}else{
			$data = $this->dbConnect->select($this->table, "*",$conditions);

		}

		$this->_view->list= $this->tables[$this->table]['list'];
		$this->_view->data=$data;
		
		$this->getView()->display("admin/header.phtml");
		$this->getView()->display("admin/elements/list.phtml");
		$this->getView()->display("admin/footer.phtml");
		
        return false;
	}

	public function updateSortAction() {

		if($this->getRequest()->isPost()){

			$raw = $this->getRequest()->getRaw();
			$data = json_decode($raw,True);
			//var_dump($data,$this->table);
		
			
			foreach ($data as $k => $v) {
				$d=$this->dbConnect->update($this->table, [
					"orderby" => $k*10
				], [
					"id" => $v
				]);
				//var_dump($d);
			}

			die(json_encode(['code'=>0,'msg'=>'OK']));
		}


        return false;
	}

	public function updateFieldsAction() {


		$id = $this->getRequest()->getParam("id");
		if($this->getRequest()->isPost()){

			$raw = $this->getRequest()->getRaw();
			$data = json_decode($raw,True);

			$redirect = false;
			if($id>0){
				$res = $this->dbConnect->update($this->table, $data, ["id"=>$id]);
			}else{
				$res = $this->dbConnect->insert($this->table, $data);
				$id = $this->dbConnect->id();
				$redirect = true;
			}
				
			die(json_encode(['code'=>0,'msg'=>$res,'id'=>$id,'redirect'=>$redirect,'url'=>$this->_view->url['prefix'].'updatefields'.'/table/'.$this->table.'/id/'.$id]));
		}


		$data = ($id>0)?$this->dbConnect->get($this->table, "*", ["id"=>$id]):[];

		//var_dump($data);

		$this->_view->fields=$this->tables[$this->table]['fields'];
		$this->_view->data = $data;

		$this->getView()->display("admin/header.phtml");
		$this->getView()->display("admin/elements/updateFields.phtml");
		$this->getView()->display("admin/footer.phtml");

        return false;
	}

	public function updateFieldAction() {

		if($this->getRequest()->isPost()){

			$id = $this->getRequest()->getPost('pk');
			$name = $this->getRequest()->getPost('name');
			$value = $this->getRequest()->getPost('value');
			//$where = $this->getRequest()->getParams();
			
			$res = $this->dbConnect->update($this->table, [
					$name  => $value
				], ["id"=>$id]);
				
			die(json_encode(['code'=>0,'msg'=>$res]));

		}

        return false;
	}

	public function toggleFieldAction() {

		if($this->getRequest()->isPost()){

			$raw = $this->getRequest()->getRaw();
			$data = json_decode($raw,True);
			
			$res = $this->dbConnect->update($this->table, [
					$data['name']  => $data['value']
				], ["id"=>$data['id']]);
				
			die(json_encode(['code'=>0,'msg'=>$res]));

		}

        return false;
	}


	public function removeAction() {

		if($this->getRequest()->isPost()){

			$raw = $this->getRequest()->getRaw();
			$data = json_decode($raw,True);
			$res = $this->dbConnect->delete($this->table,$data);
				
			die(json_encode(['code'=>0,'msg'=>$res]));
		}


        return false;
	}

	public function updateConfigAction() {

		if($this->getRequest()->isPost()){

			$name = $this->getRequest()->getPost('pk');
			//$name = $this->getRequest()->getPost('name');
			$value = $this->getRequest()->getPost('value');
			
			$res = $this->dbConnect->update('configs', [
					'value'  => $value
				], ['code'=>$name]);
				
			die(json_encode(['code'=>0,'msg'=>$res]));

		}


        return false;
	}





	public function updateConfigsAction() {

		if($this->getRequest()->isPost()){

			/*{
			  "title": "OH卡在线",
			  "logo_name": "OH卡在线",
			  "logo": "",
			  "icon": "https://www.ohcard.cn/media/photos/201806/0/3/original/3b70c9857b446e3f124d5cede5cf4faf.png",
			  "email": "info@ohcard.cn",
			  "officail_account_name": "OH卡在线公众号",
			  "copyright": "OH卡在线",
			  "icp_number": "沪ICP备17049273号-2",
			  "beiangov": "",
			  "officail_account_img": "/assets/img/official-account.jpg",
			  "technical_support": "",
			  "meta_keywords": "线上OH卡,线上欧卡,OH卡视频,OH卡游戏,OH卡教练,OH卡工具,潜意识直觉卡,潜意识投射卡",
			  "meta_description": "OH卡在线,为更多人激发创造力和想象力，捕捉、提升自觉力，增进沟通和连结，打造OH卡线上体验、学习、交互的平台"
			}*/

			$raw = $this->getRequest()->getRaw();
			$data = json_decode($raw,True);
			
			foreach ($data as $k => $v) {
				$d=$this->dbConnect->update("configs", [
					"value" => $v
				], [
					"code" => $k
				]);
				//var_dump($d);
			}

			die(json_encode(['code'=>0,'msg'=>'OK']));

		}



		$group_code = $this->getRequest()->getParam("group");

		$configs = $this->dbConnect->select("configs","*",["status"=>"1","group_code"=>$group_code,"ORDER"=>["group_code","subgroup_code","orderby"]]);
		//var_dump($configs);

		$fields = []; $data = [];
		foreach ($configs as $k => $v) {
			//var_dump($v);
			$fields[$k]=['name'=>$v['code'],'label'=>$v['name'],'type'=>$v['type'],'id'=>$v['code']];
			if(($v['type'] =="radio" || $v['type'] =="select") && $v['options']!='' ){
				$fields[$k]['options']=json_decode($v['options'],true);
			}
			$data[$v['code']] =$v['value'] ;


		}

		//var_dump($data);
		$this->_view->fields=$fields;
		$this->_view->data = $data;

		$this->getView()->display("admin/header.phtml");
		$this->getView()->display("admin/elements/updateFields.phtml");
		$this->getView()->display("admin/footer.phtml");


        return false;
	}






}
