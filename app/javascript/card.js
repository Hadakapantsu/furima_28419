const pay = () => {
  
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form"); //charge-form内のsubmitが実行されるとイベントが発火します
  form.addEventListener("submit", (e) => {
    e.preventDefault(); //preventDefault();メソッドを用いて、Railsのフォーム送信処理をキャンセル
                        //Railsのフォーム送信からサーバーサイドに値を送るのではなく、JavaScriptでサーバーサイドに値を送るためです。
 
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
 
    //入力された、カードの情報を変数に代入します。
    const card = {
      number: formData.get("card_number"),
      exp_month: formData.get("card_exp_month"),
      exp_year: `20${formData.get("card_exp_year")}`,
      cvc: formData.get("card_cvc"),
    };
    //入力された、カードの情報を変数に代入します。
    


    //PAY.JPにアクセスして、トークンを作成しています.PAY.JP側の処理でトークンの生成に成功した場合に、if文の中のコードが実行されます
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;  //生成されたトークンを変数に代入します。トークンをパラメーターとして送るために、form内に隠し要素としてトークンの値が入っているHTMLを生成します。
        const renderDom = document.getElementById("charge-form"); //生成する要素を取得
        const tokenObj = `<input value=${token} type="hidden" name='token'>`; //生成するHTMLを定義します
        renderDom.insertAdjacentHTML("beforeend", tokenObj); //formの最後に生成する処理を行っています
      }

      //入力された各カード情報がパラメーターとして送られないように、値を削除しています
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      //入力された各カード情報がパラメーターとして送られないように、値を削除しています

      //フォームに記載されている情報を、サーバーサイドへ送信します。
      document.getElementById("charge-form").submit(); 
      document.getElementById("charge-form").reset();
    });
  });
 };
 
 window.addEventListener("load", pay);