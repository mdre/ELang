/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.arshadow.elang.syntaxhighlighter;

import java.util.logging.Logger;
import org.netbeans.api.lexer.TokenId;

/**
 *
 * @author SShadow
 */
public class ETokenId implements TokenId {
    private final static Logger LOGGER = Logger.getLogger(ETokenId.class .getName());

    private final String name;
    private final String primaryCategory;
    private final int id;

    public ETokenId(String name, String primaryCategory, int id) {
        this.name = name;
        this.primaryCategory = primaryCategory;
        this.id = id;
    }
    
    @Override
    public String name() {
        return this.name;
    }

    @Override
    public int ordinal() {
        return this.id;
    }

    @Override
    public String primaryCategory() {
        return this.primaryCategory;
    }
}
