#じゃんけん
def janken
    hands = ["", "グー", "チョキ", "パー"]

    puts "じゃんけん..."
    puts "1(グー)2(チョキ)3(パー)4(戦わない)"
    player_hand = gets.to_i
    enemy_hand = rand(1..3)

    if (player_hand == 1 || player_hand == 2 || player_hand == 3)
        puts "----------------------------"
        puts "ホイ！"
        puts "あなた:#{hands[player_hand]}を出しました"
        puts "  相手:#{hands[enemy_hand]}を出しました"
        

        #あいこ
        if player_hand == enemy_hand
            puts "あいこで..."
            return true
        elsif(player_hand == 1 && enemy_hand == 2)||(player_hand == 2 && enemy_hand == 3)||(player_hand == 3 && enemy_hand == 1)
            @janken_status = "win"
            return false
        #負け
        elsif(player_hand == 1 && enemy_hand == 3)||(player_hand == 2 && enemy_hand == 1)||(player_hand == 3 && enemy_hand == 2)
            @janken_status = "lose"
            return false
        end

    elsif player_hand == 4
        puts "戦いをやめました"
        puts "-----終了-----"
        exit
    else
        puts "0~3の値のみ入力可能です"
        puts "----------------------------"
        janken
    end
end

#あっち向いてホイ
def acchimuite_hoi
    directions = ["", "上", "下", "左", "右"]
    
    puts "----------------------------"
    puts "あっち向いて〜"
    puts "1(上) 2(下) 3(左) 4(右)"
    player_direction = gets.chomp.to_i
    enemy_direction = rand(1..4)

    if player_direction == 1 || player_direction == 2 || player_direction == 3 || player_direction == 4
        puts "----------------------------"
        puts "ホイ！"
        puts "あなた:#{directions[player_direction]}"
        puts "  相手:#{directions[enemy_direction]}"
        puts "----------------------------"

        if @janken_status == "win"  && player_direction == enemy_direction
            puts "あなたの勝ち！！"
            return false            
        elsif @janken_status == "lose" && player_direction == enemy_direction
            puts "あなたの負け..."
            return false            
        else
            return true
        end

    else
        puts "1~4の数字のみ入力可能です"
        acchimuite_hoi
    end
end

def battles
    if janken == true
        return true
    elsif acchimuite_hoi ==  true
        return true
    else
        return false
    end
end

#whileを始めるため
finish_battle = true

while finish_battle do
    #battlesがtrueになれば終わり
    finish_battle = battles
end