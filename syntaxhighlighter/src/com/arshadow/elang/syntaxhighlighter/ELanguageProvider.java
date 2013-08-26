/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arshadow.elang.syntaxhighlighter;

import java.util.logging.Logger;
import org.netbeans.api.lexer.InputAttributes;
import org.netbeans.api.lexer.Language;
import org.netbeans.api.lexer.LanguagePath;
import org.netbeans.api.lexer.Token;
import org.netbeans.spi.lexer.LanguageEmbedding;
import org.netbeans.spi.lexer.LanguageProvider;

/**
 *
 * @author SShadow
 */
@org.openide.util.lookup.ServiceProvider(service=org.netbeans.spi.lexer.LanguageProvider.class)
public class ELanguageProvider extends LanguageProvider {

    private final static Logger LOGGER = Logger.getLogger(ELanguageProvider.class.getName());

    @Override
    public Language<?> findLanguage(String mimeType) {
        if ("text/x-e".equals(mimeType)) {
            return new ELanguageHierarchy().language();
        }

        return null;
    }

    @Override
    public LanguageEmbedding<?> findLanguageEmbedding(Token<?> token, LanguagePath lp, InputAttributes ia) {
        return null;
    }
}
