package widgets.UserSetting
{
	import mx.states.OverrideBase;
	import mx.validators.ValidationResult;
	import mx.validators.Validator;

	public class ComboValidator extends Validator
	{
		public function ComboValidator()
		{
			super();
		}
		//如果comboBox中没有项目被选中，则返回这个错误信息
		public var error:String;
		//提示
		public var prompt:String;
		
		//这里 进行2个检查
		//1、comboBox中有没有项目被选中
		//2、开发者有没有为comboBox加入自定义的项目
		//任何一个条件为true的话，则返回一个错误
		override protected function doValidation(value:Object):Array{
			var results:Array = [];
			if(value as String == prompt || value == null){
				var res:ValidationResult = new ValidationResult(true,"","",error);
				results.push(res);
			}
			return results;
		}
	}
}