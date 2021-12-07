USE vk;
UPDATE profiles SET is_active = 0 WHERE FLOOR((TO_DAYS(NOW()) - TO_DAYS(birthday))/365.25) < 18;
