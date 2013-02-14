package com.youthministry.repository.account;

public interface AccountRepository {

	void createAccount(Account account) throws UsernameAlreadyInUseException;

	Account findAccountByUsername(String username);

}
